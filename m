Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB73036D326
	for <lists+linux-leds@lfdr.de>; Wed, 28 Apr 2021 09:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235862AbhD1Hbl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Apr 2021 03:31:41 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39612 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236826AbhD1Hbk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Wed, 28 Apr 2021 03:31:40 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13S74AdC042206;
        Wed, 28 Apr 2021 03:30:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=md4oYIJ3ZYmG27W/FeVX5IOCEBZPzVi4BUM9k0BjSiE=;
 b=S2gAJUGVijTYgDTAboZ7s67xSm6I0MG72pMcDWYrm3GQIIy35GfAxEfiva1iFS3Za/34
 W0jnxN35hn8PVdsprYAb8ui/RUh7uqoVeX5AboI766Vl8npZJglWZoLtHIjLvVCYob4L
 6YfKpIIjV96ERsyFBUKy9YB7E7ufGv87jvc0ynn8HG61HlBOqh1AsUZDb/AZYWb1FgeA
 BxgsLJe/Q/89I324r5N8BuLb6LOFqNx87u6IZ90eSeOSZjiuRGAOS+cO4wBISV6iWn3a
 g3pl6KTTI0yFU8kyzzju3gv0yJLEqu3FTJ0FJJ9rNDUuP7I5MJzcaZRsykgG8WhkdFRO ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3872qas5bj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 28 Apr 2021 03:30:52 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13S76Xoo057880;
        Wed, 28 Apr 2021 03:30:52 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3872qas5av-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 28 Apr 2021 03:30:51 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
        by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13S7SFQJ018887;
        Wed, 28 Apr 2021 07:30:49 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
        by ppma04ams.nl.ibm.com with ESMTP id 384ay8hqqq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 28 Apr 2021 07:30:49 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 13S7UkZH33423728
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Apr 2021 07:30:46 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5D79EA4065;
        Wed, 28 Apr 2021 07:30:46 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 316CAA405B;
        Wed, 28 Apr 2021 07:30:45 +0000 (GMT)
Received: from [9.199.52.188] (unknown [9.199.52.188])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed, 28 Apr 2021 07:30:45 +0000 (GMT)
Content-Type: text/plain;
        charset=utf-8
Subject: Re: [PATCH linux dev-5.10 06/35] ARM: dts: aspeed: rainier: Add leds
 that are off PCA9552
From:   vishwanatha subbanna <vishwa@linux.vnet.ibm.com>
In-Reply-To: <babf3846-f1fd-d541-6c74-e5f167575105@gmail.com>
Date:   Wed, 28 Apr 2021 13:00:43 +0530
Cc:     vishwanatha subbanna <vishwa@linux.vnet.ibm.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, linux-leds@vger.kernel.org,
        Eddie James <eajames@linux.ibm.com>
Message-Id: <2F05B835-8710-4E2F-864F-1EB2984E24A8@linux.vnet.ibm.com>
References: <20210308225419.46530-1-eajames@linux.ibm.com>
 <20210308225419.46530-7-eajames@linux.ibm.com>
 <CACPK8Xc9XqM3UtpF0xywFwfj8anXWE1-TvbHCQskogrBBF_ZCQ@mail.gmail.com>
 <OF39939D76.45BF746F-ON00258696.0001FF38-00258696.0001FF3E@notes.na.collabserv.com>
 <CACPK8XfBu5_2xs_Eu=OtShNFQnAQ+Tc1Q1qM7Qgcaggd-yLumQ@mail.gmail.com>
 <6ACEC474-8CFD-4BA9-B8FF-CCD41007AA67@linux.vnet.ibm.com>
 <CACPK8Xf8iY5LOXgJLvBS0okokG-QNQJ3idPvmcF9eMaRQSBGzQ@mail.gmail.com>
 <4A5014B9-6152-41E0-B928-31C9380185EA@linux.vnet.ibm.com>
 <babf3846-f1fd-d541-6c74-e5f167575105@gmail.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ET3w5qNGWOw2HFc9EVrqpgES19HTU8dQ
X-Proofpoint-GUID: tK49-FglF1kcsOmjhmaXoscf4D9A-G63
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-28_03:2021-04-27,2021-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104280046
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jacek,

Thanks for reverting. The setup seems fine because, when we express these a=
s PCA955X_TYPE_GPIO and then define the
LEDs under =E2=80=9Ccompatibility=3Dgpio-leds=E2=80=9D section, then the LE=
Ds do retain the states post BMC reboot with Andrew Jeffrey=E2=80=99s patch=
: https://github.com/torvalds/linux/commit/f5808ac158f2b16b686a3d3c0879c5d6=
048aba14

Problem is only when we express LEDs as PCA955X_TYPE_LED. With Andrew Jeffr=
ey=E2=80=99s help now, I got some better understanding of load/unload. I th=
en created this hack, but that does not do the trick as well.

--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -442,9 +442,9 @@ void led_classdev_unregister(struct led_classdev *led_c=
dev)
 	led_cdev->flags |=3D LED_UNREGISTERING;
=20
 	/* Stop blinking */
-	led_stop_software_blink(led_cdev);
+    /* led_stop_software_blink(led_cdev); */
=20
-	led_set_brightness(led_cdev, LED_OFF);
+	/*led_set_brightness(led_cdev, LED_OFF); */
=20
 	flush_work(&led_cdev->set_brightness_work);
=20
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index f1f718d..833a16b 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -121,8 +121,8 @@ static void set_brightness_delayed(struct work_struct *=
ws)
 	int ret =3D 0;
=20
 	if (test_and_clear_bit(LED_BLINK_DISABLE, &led_cdev->work_flags)) {
-		led_cdev->delayed_set_value =3D LED_OFF;
-		led_stop_software_blink(led_cdev);
+		/* led_cdev->delayed_set_value =3D LED_OFF; */
+		/* led_stop_software_blink(led_cdev); */
 	}
=20
 	ret =3D __led_set_brightness(led_cdev, led_cdev->delayed_set_value);
=E2=80=94=20

Thank you,
!! Vishwa !!

> On 28-Apr-2021, at 2:52 AM, Jacek Anaszewski <jacek.anaszewski@gmail.com>=
 wrote:
>=20
> Hi Vishwanatha,
>=20
> On 4/26/21 7:59 AM, vishwanatha subbanna wrote:
>> Joel,
>> With the experiments that I have done, I can not express LEDs with PCA95=
5X_TYPE_LED predominantly because LEDs won=E2=80=99t
>> retain states after the BMC reboot. I cooked a patch and tried but it do=
es not work. I did an experiment where
>> I put the patch and then did a reboot and saw that the LEDs were [OFF] i=
n the very early stage of probe itself.
>>> From a9fe9e956c624c15a455b88cc05262358519a541 Mon Sep 17 00:00:00 2001
>> From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
>> Date: Fri, 23 Apr 2021 06:57:56 -0500
>> Subject: [PATCH 1/2] leds: pca955x: Add support for default-state
>> Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
>> ---
>>  drivers/leds/leds-pca955x.c | 12 ++++++++++--
>>  1 file changed, 10 insertions(+), 2 deletions(-)
>> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
>> index bf7ead4..987415b 100644
>> --- a/drivers/leds/leds-pca955x.c
>> +++ b/drivers/leds/leds-pca955x.c
>> @@ -130,6 +130,7 @@ struct pca955x_led {
>>  	char			name[32];
>>  	u32			type;
>>  	const char		*default_trigger;
>> +	const char		*default_state;
>>  };
>>    struct pca955x_platform_data {
>> @@ -408,6 +409,8 @@ static int pca955x_gpio_direction_output(struct gpio=
_chip *gc,
>>  		fwnode_property_read_u32(child, "type", &pdata->leds[reg].type);
>>  		fwnode_property_read_string(child, "linux,default-trigger",
>>  					&pdata->leds[reg].default_trigger);
>> +		fwnode_property_read_string(child, "default-state",
>> +					&pdata->leds[reg].default_state);
>>  	}
>>    	pdata->num_leds =3D chip->bits;
>> @@ -520,8 +523,13 @@ static int pca955x_probe(struct i2c_client *client,
>>  			if (err)
>>  				return err;
>>  -			/* Turn off LED */
>> -			err =3D pca955x_led_set(&pca955x_led->led_cdev, LED_OFF);
>> +			/* If the default-state is "keep", don't change states */
>> +			if (strcmp(pdata->leds[i].default_state, "keep")) {
>> +				if (!strcmp(pdata->leds[i].default_state, "on"))
>> +					err =3D pca955x_led_set(&pca955x_led->led_cdev, LED_ON);
>> +				else
>> +					err =3D pca955x_led_set(&pca955x_led->led_cdev, LED_OFF);
>> +			}
>>  			if (err)
>>  				return err;
>>  		}
>> =E2=80=94
>> 1.8.3.1
>> For `leds-gpio`, Andrew had put a patch, but I don=E2=80=99t see how tha=
t can be mapped to PCA955X. https://github.com/torvalds/linux/commit/f5808a=
c158f2b16b686a3d3c0879c5d6048aba14
>> Jacek,
>> Please could you help me here ?.. I need to express LEDs as PCA955X_TYPE=
_LED and also retain states post BMC reboot.
>=20
> If in your setup the LED controller loses power on reboot then there
> is nothing you can do to retain the state.
>=20
> --=20
> Best regards,
> Jacek Anaszewski

