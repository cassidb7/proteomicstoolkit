class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.references :document
      t.string :sequence
      t.string :protein
      t.string :gene
      t.decimal :intensity_1
      t.decimal :intensity_2
      t.decimal :intensity_3
      t.decimal :intensity_4
      t.decimal :intensity_5
      t.decimal :intensity_6
      t.decimal :intensity_7
      t.decimal :intensity_8
      t.decimal :intensity_9
      t.decimal :intensity_10
      t.decimal :intensity_11
      t.decimal :intensity_12
      t.decimal :intensity_13
      t.decimal :intensity_14
      t.decimal :intensity_15
      t.decimal :intensity_16
      t.decimal :intensity_17
      t.decimal :intensity_18
      t.decimal :intensity_19
      t.decimal :intensity_20
      t.decimal :intensity_21
      t.decimal :intensity_22
      t.decimal :intensity_23
      t.decimal :intensity_24
      t.decimal :intensity_25
      t.decimal :intensity_26
      t.decimal :intensity_27
      t.decimal :intensity_28
      t.decimal :intensity_29
      t.decimal :intensity_30
      t.decimal :intensity_31
      t.decimal :intensity_32
      t.decimal :intensity_33
      t.decimal :intensity_34
      t.decimal :intensity_35
      t.decimal :intensity_36
      t.decimal :intensity_37
      t.decimal :intensity_38
      t.decimal :intensity_39
      t.decimal :intensity_40
      t.decimal :intensity_41
      t.decimal :intensity_42
      t.decimal :intensity_43
      t.decimal :intensity_44
      t.decimal :intensity_45
      t.decimal :intensity_46
      t.decimal :intensity_47
      t.decimal :intensity_48
      t.decimal :intensity_49
      t.decimal :intensity_50
      t.decimal :intensity_51
      t.decimal :intensity_52
      t.decimal :intensity_53
      t.decimal :intensity_54
      t.decimal :intensity_55
      t.decimal :intensity_56
      t.decimal :intensity_57
      t.decimal :intensity_58
      t.decimal :intensity_59
      t.decimal :intensity_60

      t.timestamps
    end
  end
end
