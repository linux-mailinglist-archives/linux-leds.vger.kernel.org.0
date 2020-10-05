Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8E6283D21
	for <lists+linux-leds@lfdr.de>; Mon,  5 Oct 2020 19:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgJEROb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 5 Oct 2020 13:14:31 -0400
Received: from w1.tutanota.de ([81.3.6.162]:47720 "EHLO w1.tutanota.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726691AbgJEROb (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 5 Oct 2020 13:14:31 -0400
Received: from w3.tutanota.de (unknown [192.168.1.164])
        by w1.tutanota.de (Postfix) with ESMTP id 0D8BAFA02E7;
        Mon,  5 Oct 2020 17:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1601918067;
        s=s1; d=tutanota.com;
        h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
        bh=Q+8UJj6iWyEn30IEyKWHDpp3PbbRpxBMLgnnRwI9wNk=;
        b=p0z0n6v9Zd9nRHgh5+VwK4sxkAUxeNn8dZV4zty28aA0ohQW1ERzuSQ7oa+utnLn
        cFC5Xo8h+hRePs1cTHN9wxUrgVMNFdk3X22i5Bz06tZj/hhrkPpPoigTB1ErYlTuTlX
        77R0WJcRE7eMHAb6plk70TQnAKfqS8f57UoCCujdiZL2vgyEck65CQQW8mISKKcfwjz
        uLyhVl4RmYEFLDyzEHTuskS28Dpznwe4HzXtpuosVmQF/lPY7ZUt6jtDVBHk9HWpgu8
        ZN30cLTpcWZajgHZhmBT/luW5EGxernSwawLqlMfzFAUK0I5/ofWTwCbEjdBW7KjcCP
        hkVom/7/VA==
Date:   Mon, 5 Oct 2020 19:14:27 +0200 (CEST)
From:   ultracoolguy@tutanota.com
To:     Alexander Dahl <post@lespocky.de>, Pavel <pavel@ucw.cz>
Cc:     Dmurphy <dmurphy@ti.com>, Marek Behun <kabel@blackhole.sk>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Linux Leds <linux-leds@vger.kernel.org>
Message-ID: <MItjEho--3-2@tutanota.com>
In-Reply-To: <20201005164808.slrtmsvmw4pvwppm@falbala.internal.home.lespocky.de>
References: <MIiYgay--3-2@tutanota.com> <20201005141334.36d9441a@blackhole.sk> <MIt2NiS--3-2@tutanota.com> <3c5fce56-8604-a7d5-1017-8a075f67061e@ti.com> <MItBqjy--3-2@tutanota.com> <966c3f39-1310-dd60-6f33-0d9464ed2ff1@ti.com> <MItOR9Z--3-2@tutanota.com> <20201005164808.slrtmsvmw4pvwppm@falbala.internal.home.lespocky.de>
Subject: Re: [PATCH] leds: lm3697: Fix out-of-bound access
MIME-Version: 1.0
Content-Type: multipart/mixed; 
        boundary="----=_Part_62822_1037468345.1601918068039"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

------=_Part_62822_1037468345.1601918068039
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Agh. I added the Signed-off-by in an earlier non-published version of the c=
ommit, but forgot to add it back. But that doesn't really excuses me.

I attached the (hopefully) final version of this patch.=C2=A0 Pavel, I'll s=
end the struct rename separately after I submit this.=20

Oct 5, 2020, 16:48 by post@lespocky.de:

> Hei hei,
>
> On Mon, Oct 05, 2020 at 05:35:38PM +0200, ultracoolguy@tutanota.com wrote=
:
>
>> Well, the major benefit I see is that it makes the driver slightly
>> more readable. However I'm fine with whatever you guys decide.
>>
>> I'll attach the patch with the struct renaming removed just in case.
>>
>
> Note: your patch, especially the commit message, still needs a
> Signed-off-by line.  Please read [1] (again?) and resend.
>
> Greets
> Alex
>
> [1] https://www.kernel.org/doc/html/latest/process/submitting-patches.htm=
l
>
>> Oct 5, 2020, 14:41 by dmurphy@ti.com:
>>
>> > Gabriel
>> >
>> > On 10/5/20 9:38 AM, ultracoolguy@tutanota.com wrote:
>> >
>> >> I understand. So I should leave it like it was and do the rename in a=
nother patch?
>> >>
>> >
>> > You should do the fix in one patch and leave the structure name alone.
>> >
>> > The structure naming if fine and has no benefit and actually will make=
 it more difficult for others to backport future fixes.
>> >
>> > Unless Pavel finds benefit in accepting the structure rename.
>> >
>> > Dan
>> >
>>
>> >From ee004d26bb2f91491141aa06f5518cc411711ff0 Mon Sep 17 00:00:00 2001
>> From: Ultracoolguy <ultracoolguy@tutanota.com>
>> Date: Fri, 2 Oct 2020 18:27:00 -0400
>> Subject: [PATCH] leds:lm3697:Fix out-of-bound access
>>
>> If both led banks aren't used in device tree,
>> an out-of-bounds condition in lm3697_init occurs
>> because of the for loop assuming that all the banks are used.
>> Fix it by adding a variable that contains the number of used banks.
>> ---
>> drivers/leds/leds-lm3697.c | 18 ++++++++++--------
>> 1 file changed, 10 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
>> index 024983088d59..bd53450050b2 100644
>> --- a/drivers/leds/leds-lm3697.c
>> +++ b/drivers/leds/leds-lm3697.c
>> @@ -78,8 +78,9 @@ struct lm3697 {
>> struct mutex lock;
>>
>> int bank_cfg;
>> +=09int num_banks;
>>
>> -=09struct lm3697_led leds[];
>> +=09struct lm3697_led banks[];
>> };
>>
>> static const struct reg_default lm3697_reg_defs[] =3D {
>> @@ -180,8 +181,8 @@ static int lm3697_init(struct lm3697 *priv)
>> if (ret)
>> dev_err(&priv->client->dev, "Cannot write OUTPUT config\n");
>>
>> -=09for (i =3D 0; i < LM3697_MAX_CONTROL_BANKS; i++) {
>> -=09=09led =3D &priv->leds[i];
>> +=09for (i =3D 0; i < priv->num_banks; i++) {
>> +=09=09led =3D &priv->banks[i];
>> ret =3D ti_lmu_common_set_ramp(&led->lmu_data);
>> if (ret)
>> dev_err(&priv->client->dev, "Setting the ramp rate failed\n");
>> @@ -228,7 +229,7 @@ static int lm3697_probe_dt(struct lm3697 *priv)
>> goto child_out;
>> }
>>
>> -=09=09led =3D &priv->leds[i];
>> +=09=09led =3D &priv->banks[i];
>>
>> ret =3D ti_lmu_common_get_brt_res(&priv->client->dev,
>> child, &led->lmu_data);
>> @@ -307,16 +308,17 @@ static int lm3697_probe(struct i2c_client *client,
>> int ret;
>>
>> count =3D device_get_child_node_count(&client->dev);
>> -=09if (!count) {
>> -=09=09dev_err(&client->dev, "LEDs are not defined in device tree!");
>> -=09=09return -ENODEV;
>> +=09if (!count || count > LM3697_MAX_CONTROL_BANKS) {
>> +=09=09return -EINVAL;
>> }
>>
>> -=09led =3D devm_kzalloc(&client->dev, struct_size(led, leds, count),
>> +=09led =3D devm_kzalloc(&client->dev, struct_size(led, banks, count),
>> GFP_KERNEL);
>> if (!led)
>> return -ENOMEM;
>>
>> +=09led->num_banks =3D count;
>> +
>> mutex_init(&led->lock);
>> i2c_set_clientdata(client, led);
>>
>> --=20
>> 2.28.0
>>
>
>
> --=20
> /"\ ASCII RIBBON | =C2=BBWith the first link, the chain is forged. The fi=
rst
> \ / CAMPAIGN     | speech censured, the first thought forbidden, the
> X  AGAINST      | first freedom denied, chains us all irrevocably.=C2=AB
> / \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
>


------=_Part_62822_1037468345.1601918068039
Content-Type: text/x-patch; charset=us-ascii; 
	name=0001-leds-lm3697-Fix-out-of-bound-access.patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; 
	filename=0001-leds-lm3697-Fix-out-of-bound-access.patch

From 146c98f0a0227fc3e11ffe6e66f0f7cf8aaebc69 Mon Sep 17 00:00:00 2001
From: Gabriel David <ultracoolguy@tutanota.com>
Date: Fri, 2 Oct 2020 18:27:00 -0400
Subject: [PATCH] leds:lm3697:Fix out-of-bound access

If both led banks aren't used in device tree,
an out-of-bounds condition in lm3697_init occurs
because of the for loop assuming that all the banks are used.
Fix it by adding a variable that contains the number of used banks.

Signed-off-by: Gabriel David <ultracoolguy@tutanota.com>
---
 drivers/leds/leds-lm3697.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index 024983088d59..a3c44b4c9072 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -78,8 +78,9 @@ struct lm3697 {
 	struct mutex lock;

 	int bank_cfg;
+	int num_banks;

-	struct lm3697_led leds[];
+	struct lm3697_led banks[];
 };

 static const struct reg_default lm3697_reg_defs[] = {
@@ -180,8 +181,8 @@ static int lm3697_init(struct lm3697 *priv)
 	if (ret)
 		dev_err(&priv->client->dev, "Cannot write OUTPUT config\n");

-	for (i = 0; i < LM3697_MAX_CONTROL_BANKS; i++) {
-		led = &priv->leds[i];
+	for (i = 0; i < priv->num_banks; i++) {
+		led = &priv->banks[i];
 		ret = ti_lmu_common_set_ramp(&led->lmu_data);
 		if (ret)
 			dev_err(&priv->client->dev, "Setting the ramp rate failed\n");
@@ -228,7 +229,7 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 			goto child_out;
 		}

-		led = &priv->leds[i];
+		led = &priv->banks[i];

 		ret = ti_lmu_common_get_brt_res(&priv->client->dev,
 						child, &led->lmu_data);
@@ -307,16 +308,16 @@ static int lm3697_probe(struct i2c_client *client,
 	int ret;

 	count = device_get_child_node_count(&client->dev);
-	if (!count) {
-		dev_err(&client->dev, "LEDs are not defined in device tree!");
-		return -ENODEV;
-	}
+	if (!count || count > LM3697_MAX_CONTROL_BANKS)
+		return -EINVAL;

-	led = devm_kzalloc(&client->dev, struct_size(led, leds, count),
+	led = devm_kzalloc(&client->dev, struct_size(led, banks, count),
 			   GFP_KERNEL);
 	if (!led)
 		return -ENOMEM;

+	led->num_banks = count;
+
 	mutex_init(&led->lock);
 	i2c_set_clientdata(client, led);

--
2.28.0


------=_Part_62822_1037468345.1601918068039--
