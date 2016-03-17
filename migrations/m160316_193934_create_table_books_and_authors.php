<?php

use yii\db\Migration;
use yii\db\Schema;

class m160316_193934_create_table_books_and_authors extends Migration
{
    const BOOKS = 'books';
    const AUTHORS = 'authors';

    public function safeUp()
    {
        $this->createTable(self::BOOKS, [
            'id' => Schema::TYPE_PK,
            'name' => Schema::TYPE_STRING . ' NOT NULL',
            'date_create' => Schema::TYPE_DATE,
            'date_update' => Schema::TYPE_DATE,
            'preview' => Schema::TYPE_STRING,
            'date' => Schema::TYPE_DATE . ' NOT NULL',
            'author_id' => Schema::TYPE_INTEGER . ' NOT NULL',
        ]);

        $this->createTable(self::AUTHORS, [
            'id' => Schema::TYPE_PK,
            'firstname' => Schema::TYPE_STRING . ' NOT NULL',
            'lastname' => Schema::TYPE_STRING . ' NOT NULL',
        ]);

        $this->addForeignKey('books_authors_fkey', self::BOOKS, 'author_id', self::AUTHORS, 'id');
    }

    public function safeDown()
    {
        $this->dropTable(self::BOOKS);
        $this->dropTable(self::AUTHORS);
    }
}
