Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E87D135F1E0
	for <lists+linux-leds@lfdr.de>; Wed, 14 Apr 2021 13:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236131AbhDNLHT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 14 Apr 2021 07:07:19 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:2624 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235888AbhDNLHS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Wed, 14 Apr 2021 07:07:18 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13EB45wN065991;
        Wed, 14 Apr 2021 07:06:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=6xAl8VklugE8qWNIPzZ9ojqrrgNSPo5JF6wrhTxOXJ0=;
 b=qP5rq2c9gkV3ECMTy/VnwEu6MgBj+yQvNGsrsMKO0pj1ntLRTdtob77DjYQAKtzTKIkL
 6rnxFOyzrXzE7g1AuvL1ajU9jubf/SuyFieEBTOYVPYODgL+kItPl1+CDz3R7QLQL5dD
 hNTmPUVCUlGqyDUErSz8QZvGhcS5w96RZ+nAww6zKanyw/gKKlNo4Gvb007xCgT6A3WU
 eX5VsI87Hz0YG+iQVBZKSqjPFuqaGyO+cpSY5zq0wYnkmnAqXZeVK0g/gfFeXwEwPahv
 asi++APJhgmFA+Pm6zDJlxeDFkkQyQWUQofylwlSz3Jn+9IxY6V9agGabBbiu8zhoPNd kg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0b-001b2d01.pphosted.com with ESMTP id 37wva4dad3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 14 Apr 2021 07:06:36 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13EAwFPq031932;
        Wed, 14 Apr 2021 11:06:35 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma03ams.nl.ibm.com with ESMTP id 37u3n8b803-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 14 Apr 2021 11:06:35 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 13EB6WSu38994192
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 14 Apr 2021 11:06:32 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B1A2F5205A;
        Wed, 14 Apr 2021 11:06:32 +0000 (GMT)
Received: from [9.85.118.19] (unknown [9.85.118.19])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 4434D52050;
        Wed, 14 Apr 2021 11:06:31 +0000 (GMT)
Content-Type: text/plain;
        charset=utf-8
Subject: Re: [PATCH] leds: pca955x: Allow full control over led name
From:   vishwanatha subbanna <vishwa@linux.vnet.ibm.com>
In-Reply-To: <1807483D-FF4A-454F-B0B9-AC373B938292@linux.vnet.ibm.com>
Date:   Wed, 14 Apr 2021 16:36:29 +0530
Cc:     vishwanatha subbanna <vishwa@linux.vnet.ibm.com>,
        Dan Murphy <dmurphy@ti.com>,
        =?utf-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
        Andrew Jeffery <andrew@aj.id.au>, linux-leds@vger.kernel.org,
        Brad Bishop <bradleyb@fuzziesquirrel.com>,
        Joel Stanley <joel@jms.id.au>,
        Eddie James <eajames@linux.ibm.com>
Message-Id: <89F30648-69BA-4535-B98B-E9A8E67807D6@linux.vnet.ibm.com>
References: <20210325005456.152469-1-joel@jms.id.au>
 <1807483D-FF4A-454F-B0B9-AC373B938292@linux.vnet.ibm.com>
To:     Pavel Machek <pavel@ucw.cz>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yqRofB1Ioo1AK4FxVXpcuw_uohClf2Q9
X-Proofpoint-GUID: yqRofB1Ioo1AK4FxVXpcuw_uohClf2Q9
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-14_06:2021-04-14,2021-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104140077
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel / Dan,

Related to this below email, Can this https://github.com/openbmc/linux/blob=
/dev-5.10/drivers/leds/leds-pca955x.c#L507 naming change ever ?.

If there is any change in https://github.com/openbmc/linux/blob/dev-5.10/dr=
ivers/leds/leds-pca955x.c#L507, then my config having led names would break.
So, please suggest me what is the right approach here for defining LEDs. I =
have all LEDs defined as=20


    leds {
        compatible =3D "gpio-leds=E2=80=9D;

I am being asked by Joel Stanley that I should not do that way, but instead=
, have the LEDs defined as PCA_955X_LED and if I do that, I have this conce=
rn with the led names.

Thanks,
Vishwa.

> On 09-Apr-2021, at 4:43 PM, vishwanatha subbanna <vishwa@linux.vnet.ibm.c=
om> wrote:
>=20
>=20
> Hello Pavel / Dan,
>=20
> Wonder if you have any feedback on this patch from Joel ?.. This patch wo=
uld help me have predictable LED names as I wanted instead of having the pr=
efixes.
> I have some configuration files that depend on these names. So, if the LE=
D name ( prefix ) changes in the future, then it breaks the configuration.
>=20
>=20
> I see good value in getting this patch in. Please could you help chime in=
 ?
>=20
> Thank you,
> !! Vishwa !!
>=20
>=20
>> On 25-Mar-2021, at 6:24 AM, Joel Stanley <joel@jms.id.au> wrote:
>>=20
>> The PCA955x driver since it was merged has added a "pca955x:" prefix to
>> LED names. This meanas platform data (such as the device tree) cannot
>> fully control the name. Here's what this produces using the example in
>> the device tree bindings:
>>=20
>> # cat /sys/class/leds/
>> pca955x:green:power/
>> pca955x:pca9552:white/
>> pca955x:pca9552:yellow/
>> pca955x:red:power/
>>=20
>> Some systems want the ability to configure the full string. To do this,
>> introduce a build time option that adds the prefix that defaults to
>> enabled in order to preserve existing behaviour.
>>=20
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>> drivers/leds/Kconfig        | 11 +++++++++++
>> drivers/leds/leds-pca955x.c |  8 +++++++-
>> 2 files changed, 18 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index b6742b4231bf..dcdb107e0967 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -519,6 +519,17 @@ config LEDS_PCA955X
>> 	  LED driver chips accessed via the I2C bus.  Supported
>> 	  devices include PCA9550, PCA9551, PCA9552, and PCA9553.
>>=20
>> +config LEDS_PCA955X_SYSFS_PREFIX
>> +	bool "PCA955x sysfs prefix"
>> +	depends on LEDS_PCA955X
>> +	default y
>> +	help
>> +	  This option adds the string "pca955x:" to the start of the name
>> +	  presented in sysfs.
>> +
>> +	  If you wish to use the label provided by platform data without a
>> +	  prefix, disable this option.
>> +
>> config LEDS_PCA955X_GPIO
>> 	bool "Enable GPIO support for PCA955X"
>> 	depends on LEDS_PCA955X
>> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
>> index 7087ca4592fc..b7742d6226b5 100644
>> --- a/drivers/leds/leds-pca955x.c
>> +++ b/drivers/leds/leds-pca955x.c
>> @@ -61,6 +61,12 @@
>> #define PCA955X_GPIO_HIGH	LED_OFF
>> #define PCA955X_GPIO_LOW	LED_FULL
>>=20
>> +#ifdef CONFIG_LEDS_PCA955X_SYSFS_PREFIX
>> +#define SYSFS_NAME "pca955x:%s"
>> +#else
>> +#define SYSFS_NAME "%s"
>> +#endif
>> +
>> enum pca955x_type {
>> 	pca9550,
>> 	pca9551,
>> @@ -504,7 +510,7 @@ static int pca955x_probe(struct i2c_client *client,
>> 					sizeof(pdata->leds[i].name), "%d", i);
>>=20
>> 			snprintf(pca955x_led->name,
>> -				sizeof(pca955x_led->name), "pca955x:%s",
>> +				sizeof(pca955x_led->name), SYSFS_NAME,
>> 				pdata->leds[i].name);
>>=20
>> 			if (pdata->leds[i].default_trigger)
>> --=20
>> 2.30.2
>>=20
>=20

