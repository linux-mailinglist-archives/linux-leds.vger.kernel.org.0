Return-Path: <linux-leds+bounces-4182-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1E2A55AD1
	for <lists+linux-leds@lfdr.de>; Fri,  7 Mar 2025 00:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 362423B1D08
	for <lists+linux-leds@lfdr.de>; Thu,  6 Mar 2025 23:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B821F161320;
	Thu,  6 Mar 2025 23:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b="fP4SIAa6"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDFA2E336F
	for <linux-leds@vger.kernel.org>; Thu,  6 Mar 2025 23:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741303067; cv=pass; b=cpLq5IA6GGyhxRIqVri8CShTMasJ4yIuYL4v5VoRS837uBskE2IPE8Ck25hUkrzKZKiXRM/k8eaSHBktN7GbT6c5ohjzTHNBjUuL5BErIgJlJiY95fpWyEVEw4ADXZJTAj8uf3kkGUTZIRSnJQZi2Z9a6tlP94UNSIl85zohWZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741303067; c=relaxed/simple;
	bh=FNf406OT+LZ3gZ86Hn3QMC5ahv7FdadAB3xHNFnhVcY=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=kutvPSrqZru2C0s7F7uHJ2n8WkiDuW5n5F43hFz82aN2eKY6zM38eMDNsi90MYwbGTDbLVBqcunoZiFnaIo0VSrbjPhyUH9sDTUqc1uQRqcyEgdmSkPbWDheJdq6Ib2a1lXpClGocIEQYQ1fRucRxDW8szlpcqIX6VgPnn1d3pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au; spf=pass smtp.mailfrom=mcqueen.au; dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b=fP4SIAa6; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mcqueen.au
ARC-Seal: i=1; a=rsa-sha256; t=1741303063; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BNrvTbnJXM+apIZYcyHstgW6uY4XV9trP1eNnQtX6nQF+Bt41Th55JQdR3KKQnqLjl/zrAaHFA96myPjvHzKyY7pRShKMcE87r4RTg4Ke6oIbFtAB5iN7KrFWF4Yzz6738QcyH0nblNU1ZK3pIplLq1c7ACyOkfI9YEFoekYyqg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741303063; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VvtTImenDoWTWgQgz5806z0P/lAOCCnbfDcSTuPHbgI=; 
	b=UQbusA6r5dyNtb+szDCYAPhN41b4Ie42cznpfyN4aad94YRF8n4+vI9LCLLP4qSbtsZhGxjOhr0FrJneTy2YGiAEAj+NAOMsgqgtch6OEN7lCesLtFQHnQQW1CsFEkazjuSFu3qZ4wzxhz91f3ZZQp0ME3tEJQ6IeiOBSM4qsE4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=mcqueen.au;
	spf=pass  smtp.mailfrom=craig@mcqueen.au;
	dmarc=pass header.from=<craig@mcqueen.au>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741303063;
	s=zmail; d=mcqueen.au; i=craig@mcqueen.au;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=VvtTImenDoWTWgQgz5806z0P/lAOCCnbfDcSTuPHbgI=;
	b=fP4SIAa6lLRTXRwn4Mhbte2Vj2ry8NtPbcu+fBIulLhxVxOBL89vyiQYX7frKe+P
	o5+nTVMLjmbwQ2mpL4IaOh6mu+GZEWoabqAqaaz7qiNeweWvC4CfchjQNasC6a4mSJs
	HDtjM8e5NKvIhc2CiKrCiT7RTdhmQvdlrZ8Cegn8=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1741303061954626.1994433927541; Thu, 6 Mar 2025 15:17:41 -0800 (PST)
Date: Fri, 07 Mar 2025 10:17:41 +1100
From: Craig McQueen <craig@mcqueen.au>
To: "Craig McQueen" <craig@mcqueen.au>
Cc: "linux-leds" <linux-leds@vger.kernel.org>
Message-ID: <1956dc01da3.f5336d7b857007.1212283592617447770@mcqueen.au>
In-Reply-To: <20250306114640.313793-1-craig@mcqueen.au>
References: <20250306114640.313793-1-craig@mcqueen.au>
Subject: Re: [PATCH] leds: Introduce userspace LED triggers driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Please don't apply this patch. I realised that the Documentation/leds/index=
.rst needs to add the new uledtriggers.rst.

I will make a patch v2 in due course. But I'd like to wait for any other fe=
edback first.



---- On Thu, 06 Mar 2025 22:46:39 +1100 Craig McQueen  wrote ---

 > This driver creates a userspace LED triggers driver similar to=20
 > uleds and uinput.=20
 > =20
 > New LED triggers s are created by opening /dev/uledtriggers and writing=
=20
 > a uledtriggers_user_dev struct. A new LED trigger is registered with the=
=20
 > name given in the struct.=20
 > =20
 > After the initial setup, writing an int value will set the trigger's=20
 > brightness, equivalent to calling led_trigger_event().=20
 > =20
 > Alternatively, there are ioctls for setup, changing trigger brightness,=
=20
 > or doing blinking.=20
 > =20
 > Closing the file handle to /dev/uledtriggers will remove the LED=20
 > trigger.=20
 > ---=20
 >  Documentation/leds/uledtriggers.rst |  36 +++=20
 >  drivers/leds/Kconfig                |   9 +=20
 >  drivers/leds/Makefile               |   1 +=20
 >  drivers/leds/uledtriggers.c         | 384 ++++++++++++++++++++++++++++=
=20
 >  include/uapi/linux/uledtriggers.h   | 123 +++++++++=20
 >  5 files changed, 553 insertions(+)=20
 >  create mode 100644 Documentation/leds/uledtriggers.rst=20
 >  create mode 100644 drivers/leds/uledtriggers.c=20
 >  create mode 100644 include/uapi/linux/uledtriggers.h=20
 > =20
 > diff --git a/Documentation/leds/uledtriggers.rst b/Documentation/leds/ul=
edtriggers.rst=20
 > new file mode 100644=20
 > index 000000000000..6ec5cbf8f13e=20
 > --- /dev/null=20
 > +++ b/Documentation/leds/uledtriggers.rst=20
 > @@ -0,0 +1,36 @@=20
 > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=20
 > +Userspace LED Triggers=20
 > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=20
 > +=20
 > +The uledtriggers driver supports userspace LED triggers. This can be us=
eful=20
 > +to create a more flexible architecture for applications to control LEDs=
.=20
 > +=20
 > +=20
 > +Usage=20
 > +=3D=3D=3D=3D=3D=20
 > +=20
 > +When the driver is loaded, a character device is created at /dev/uledtr=
iggers.=20
 > +To create a new LED trigger, open /dev/uledtriggers and write a=20
 > +uledtriggers_user_dev structure to it (found in kernel public header fi=
le=20
 > +linux/uledtriggers.h)::=20
 > +=20
 > +    #define LED_TRIGGER_MAX_NAME_SIZE 50=20
 > +=20
 > +    struct uledtriggers_user_dev {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0char name[LED_TRIGGER_MAX_NAME_SIZE];=20
 > +    };=20
 > +=20
 > +A new LED trigger will be created with the name given. The name can con=
sist of=20
 > +alphanumeric, hyphen and underscore characters.=20
 > +=20
 > +After the initial setup, writing an int value will set the trigger's=20
 > +brightness, equivalent to calling led_trigger_event().=20
 > +=20
 > +Alternatively, there are ioctls (defined in the public header file) for=
 setup,=20
 > +changing trigger brightness, or doing blinking.=20
 > +=20
 > +The LED trigger will be removed when the open file handle to /dev/uledt=
riggers=20
 > +is closed.=20
 > +=20
 > +Multiple LED triggers are created by opening additional file handles to=
=20
 > +/dev/uledtriggers.=20
 > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig=20
 > index 2b27d043921c..7cd2fbcb1aa5 100644=20
 > --- a/drivers/leds/Kconfig=20
 > +++ b/drivers/leds/Kconfig=20
 > @@ -921,6 +921,15 @@ config LEDS_USER=20
 >  =C2=A0=C2=A0=C2=A0=C2=A0  support in kernel. To compile this driver as =
a module, choose 'm' here:=20
 >  =C2=A0=C2=A0=C2=A0=C2=A0  the module will be called uleds.=20
 > =20
 > +config LED_TRIGGERS_USER=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0tristate "Userspace LED triggers support"=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0depends on LEDS_CLASS=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0select LEDS_TRIGGERS=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0help=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0  This option enables support for userspace LED=
 triggers. Say 'y' to enable=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0  this support in kernel. To compile this drive=
r as a module, choose 'm'=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0  here: the module will be called uledtriggers.=
=20
 > +=20
 >  config LEDS_NIC78BX=20
 >  =C2=A0=C2=A0=C2=A0=C2=A0tristate "LED support for NI PXI NIC78bx device=
s"=20
 >  =C2=A0=C2=A0=C2=A0=C2=A0depends on LEDS_CLASS=20
 > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile=20
 > index 6ad52e219ec6..c71569a59b15 100644=20
 > --- a/drivers/leds/Makefile=20
 > +++ b/drivers/leds/Makefile=20
 > @@ -108,6 +108,7 @@ obj-$(CONFIG_LEDS_SPI_BYTE)=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0+=3D leds-spi-byte.o=20
 > =20
 >  # LED Userspace Drivers=20
 >  obj-$(CONFIG_LEDS_USER)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0+=3D uleds.o=20
 > +obj-$(CONFIG_LED_TRIGGERS_USER)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+=3D uledtriggers.o=20
 > =20
 >  # Flash and Torch LED Drivers=20
 >  obj-$(CONFIG_LEDS_CLASS_FLASH)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0+=3D flash/=20
 > diff --git a/drivers/leds/uledtriggers.c b/drivers/leds/uledtriggers.c=
=20
 > new file mode 100644=20
 > index 000000000000..4fdb8cf4c82d=20
 > --- /dev/null=20
 > +++ b/drivers/leds/uledtriggers.c=20
 > @@ -0,0 +1,384 @@=20
 > +// SPDX-License-Identifier: GPL-2.0-or-later=20
 > +/*=20
 > + * Userspace LED triggers driver=20
 > + *=20
 > + * Copyright (C) 2025 Craig McQueen craig@mcqueen.au>=20
 > + */=20
 > +#include =20
 > +#include =20
 > +#include =20
 > +#include =20
 > +#include =20
 > +#include =20
 > +=20
 > +#include =20
 > +=20
 > +#define ULEDTRIGGERS_NAME=C2=A0=C2=A0=C2=A0=C2=A0"uledtriggers"=20
 > +=20
 > +enum uledtriggers_state {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0ULEDTRIGGERS_STATE_UNKNOWN,=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0ULEDTRIGGERS_STATE_REGISTERED,=20
 > +};=20
 > +=20
 > +enum uledtriggers_trig_state {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0TRIG_STATE_EVENT,=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0TRIG_STATE_BLINK,=20
 > +};=20
 > +=20
 > +struct uledtriggers_device {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0struct uledtriggers_user_dev=C2=A0=C2=A0=C2=A0=
=C2=A0user_dev;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0struct led_trigger=C2=A0=C2=A0=C2=A0=C2=A0led_t=
rigger;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0struct mutex=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0mutex;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0enum uledtriggers_state=C2=A0=C2=A0=C2=A0=C2=A0=
state;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0enum uledtriggers_trig_state=C2=A0=C2=A0=C2=A0=
=C2=A0trig_state;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0int=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0brightness;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0unsigned long=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0trig_delay_on;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0unsigned long=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0trig_delay_off;=20
 > +};=20
 > +=20
 > +static struct miscdevice uledtriggers_misc;=20
 > +=20
 > +static int set_led_trigger(struct uledtriggers_device *udev)=20
 > +{=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0int retval =3D 0;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0enum uledtriggers_trig_state trig_state;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0retval =3D mutex_lock_interruptible(&udev->mute=
x);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0if (retval)=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return retval;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0trig_state =3D udev->trig_state;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0switch (trig_state) {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0default:=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0case TRIG_STATE_EVENT:=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0led_trigger_event(&udev=
->led_trigger, udev->brightness);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0case TRIG_STATE_BLINK:=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0led_trigger_blink(&udev=
->led_trigger, udev->trig_delay_on, udev->trig_delay_off);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0}=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&udev->mutex);=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0return retval;=20
 > +}=20
 > +=20
 > +/*=20
 > + * When an LED is connected to the trigger, this 'activate' function ru=
ns and=20
 > + * sets the initial state of the LED.=20
 > + */=20
 > +static int uledtriggers_trig_activate(struct led_classdev *led_cdev)=20
 > +{=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0struct led_trigger=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0*trig;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0struct uledtriggers_device=C2=A0=C2=A0=C2=A0=C2=
=A0*udev;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0trig =3D led_cdev->trigger;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0udev =3D container_of(trig, struct uledtriggers=
_device, led_trigger);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0return set_led_trigger(udev);=20
 > +}=20
 > +=20
 > +static int uledtriggers_open(struct inode *inode, struct file *file)=20
 > +{=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0struct uledtriggers_device *udev;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0udev =3D kzalloc(sizeof(*udev), GFP_KERNEL);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0if (!udev)=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -ENOMEM;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0mutex_init(&udev->mutex);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0udev->state =3D ULEDTRIGGERS_STATE_UNKNOWN;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0file->private_data =3D udev;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0stream_open(inode, file);=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0return 0;=20
 > +}=20
 > +=20
 > +/*=20
 > + * Name validation: Allow only alphanumeric, hyphen or underscore.=20
 > + */=20
 > +static bool is_trigger_name_valid(const char * name)=20
 > +{=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0size_t i;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0if (name[0] =3D=3D '\0')=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return false;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < TRIG_NAME_MAX; i++) {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (name[i] =3D=3D '\0'=
)=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0break;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!isalnum(name[i]) &=
& name[i] !=3D '-' && name[i] !=3D '_')=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0return false;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0}=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/* Length check. */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0return (i < TRIG_NAME_MAX);=20
 > +}=20
 > +=20
 > +static int dev_setup(struct uledtriggers_device *udev, const char __use=
r *buffer)=20
 > +{=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0const char *name;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0int retval;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0retval =3D mutex_lock_interruptible(&udev->mute=
x);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0if (retval)=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return retval;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0if (udev->state =3D=3D ULEDTRIGGERS_STATE_REGIS=
TERED) {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0retval =3D -EBUSY;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto out;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0}=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0if (copy_from_user(&udev->user_dev, buffer,=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0   sizeof(struct uledtriggers_user_dev))) {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0retval =3D -EFAULT;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto out;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0}=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0name =3D udev->user_dev.name;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0if (!is_trigger_name_valid(name)) {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0retval =3D -EINVAL;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto out;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0}=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0udev->led_trigger.name =3D udev->user_dev.name;=
=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0udev->led_trigger.activate =3D uledtriggers_tri=
g_activate;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0retval =3D led_trigger_register(&udev->led_trig=
ger);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0if (retval < 0) {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0udev->led_trigger.name =
=3D NULL;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto out;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0}=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0udev->state =3D ULEDTRIGGERS_STATE_REGISTERED;=
=20
 > +=20
 > +out:=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&udev->mutex);=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0return retval;=20
 > +}=20
 > +=20
 > +static int write_brightness(struct uledtriggers_device *udev, const cha=
r __user *buffer)=20
 > +{=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0int retval;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0int brightness;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0retval =3D mutex_lock_interruptible(&udev->mute=
x);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0if (retval)=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return retval;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0if (udev->state !=3D ULEDTRIGGERS_STATE_REGISTE=
RED) {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0retval =3D -EBUSY;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto out;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0}=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0if (copy_from_user(&brightness, buffer,=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0   sizeof(brightness))) {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0retval =3D -EFAULT;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto out;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0}=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0udev->trig_delay_on =3D 0u;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0udev->trig_delay_off =3D 0u;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0udev->brightness =3D brightness;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0udev->trig_state =3D TRIG_STATE_EVENT;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0led_trigger_event(&udev->led_trigger, brightnes=
s);=20
 > +=20
 > +out:=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&udev->mutex);=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0return retval;=20
 > +}=20
 > +=20
 > +static ssize_t uledtriggers_write(struct file *file, const char __user =
*buffer,=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0size_t count, loff_t *ppos)=20
 > +{=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0struct uledtriggers_device *udev =3D file->priv=
ate_data;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0int retval;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0if (count =3D=3D 0)=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0switch (udev->state) {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0case ULEDTRIGGERS_STATE_UNKNOWN:=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (count !=3D sizeof(s=
truct uledtriggers_user_dev)) {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0return -EINVAL;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0retval =3D dev_setup(ud=
ev, buffer);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (retval < 0)=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0return retval;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return count;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0case ULEDTRIGGERS_STATE_REGISTERED:=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (count !=3D sizeof(i=
nt)) {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0return -EINVAL;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0retval =3D write_bright=
ness(udev, buffer);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (retval < 0)=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0return retval;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return count;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0default:=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EBADFD;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0}=20
 > +}=20
 > +=20
 > +static long uledtriggers_ioctl(struct file *file, unsigned int cmd, uns=
igned long arg)=20
 > +{=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0struct uledtriggers_device *udev =3D file->priv=
ate_data;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0struct uledtriggers_blink blink;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0struct uledtriggers_blink_oneshot blink_oneshot=
;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0int brightness;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0int retval =3D 0;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/*=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * the direction is a bitmask, and VERIFY_WRITE=
 catches R/W=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * transfers. `Direction' is user-oriented, whi=
le=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * access_ok is kernel-oriented, so the concept=
 of "read" and=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * "write" is reversed=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0retval =3D 0;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0if (_IOC_DIR(cmd) & _IOC_READ)=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0retval =3D !access_ok((=
void __user *)arg, _IOC_SIZE(cmd));=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0else if (_IOC_DIR(cmd) & _IOC_WRITE)=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0retval =3D !access_ok((=
void __user *)arg, _IOC_SIZE(cmd));=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0if (retval)=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EFAULT;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0switch (cmd) {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0case ULEDTRIGGERS_IOC_DEV_SETUP:=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0retval =3D dev_setup(ud=
ev, (const char __user *)arg);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0case ULEDTRIGGERS_IOC_OFF:=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0retval =3D mutex_lock_i=
nterruptible(&udev->mutex);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (retval)=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0return retval;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (udev->state !=3D UL=
EDTRIGGERS_STATE_REGISTERED) {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0mutex_unlock(&udev->mutex);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0return -EINVAL;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0udev->trig_delay_on =3D=
 0u;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0udev->trig_delay_off =
=3D 0u;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0udev->brightness =3D 0;=
=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0udev->trig_state =3D TR=
IG_STATE_EVENT;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0led_trigger_event(&udev=
->led_trigger, LED_OFF);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&udev->mut=
ex);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0case ULEDTRIGGERS_IOC_ON:=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0retval =3D mutex_lock_i=
nterruptible(&udev->mutex);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (retval)=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0return retval;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (udev->state !=3D UL=
EDTRIGGERS_STATE_REGISTERED) {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0mutex_unlock(&udev->mutex);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0return -EINVAL;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0udev->trig_delay_on =3D=
 0u;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0udev->trig_delay_off =
=3D 0u;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0udev->brightness =3D LE=
D_FULL;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0udev->trig_state =3D TR=
IG_STATE_EVENT;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0led_trigger_event(&udev=
->led_trigger, LED_FULL);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&udev->mut=
ex);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0case ULEDTRIGGERS_IOC_EVENT:=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0retval =3D copy_from_us=
er(&brightness,=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0(int __user *)arg,=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0sizeof(brightness));=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (retval)=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0return retval;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0retval =3D mutex_lock_i=
nterruptible(&udev->mutex);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (retval)=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0return retval;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (udev->state !=3D UL=
EDTRIGGERS_STATE_REGISTERED) {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0mutex_unlock(&udev->mutex);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0return -EINVAL;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0udev->trig_delay_on =3D=
 0u;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0udev->trig_delay_off =
=3D 0u;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0udev->brightness =3D br=
ightness;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0udev->trig_state =3D TR=
IG_STATE_EVENT;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0led_trigger_event(&udev=
->led_trigger, brightness);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&udev->mut=
ex);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0case ULEDTRIGGERS_IOC_BLINK:=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0retval =3D copy_from_us=
er(&blink,=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0(struct uledtriggers_blink __user *)arg,=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0sizeof(blink));=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (retval)=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0return retval;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0retval =3D mutex_lock_i=
nterruptible(&udev->mutex);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (retval)=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0return retval;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (udev->state !=3D UL=
EDTRIGGERS_STATE_REGISTERED) {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0mutex_unlock(&udev->mutex);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0return -EINVAL;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0udev->trig_delay_on =3D=
 blink.delay_on;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0udev->trig_delay_off =
=3D blink.delay_off;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0udev->brightness =3D LE=
D_FULL;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0udev->trig_state =3D TR=
IG_STATE_BLINK;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0led_trigger_blink(&udev=
->led_trigger, blink.delay_on, blink.delay_off);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&udev->mut=
ex);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0case ULEDTRIGGERS_IOC_BLINK_ONESHOT:=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0retval =3D copy_from_us=
er(&blink_oneshot,=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0(struct uledtriggers_blink_oneshot __user *)arg,=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0sizeof(blink_oneshot));=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (retval)=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0return retval;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (blink_oneshot.__unu=
sed)=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0return -EINVAL;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0retval =3D mutex_lock_i=
nterruptible(&udev->mutex);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (retval)=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0return retval;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (udev->state !=3D UL=
EDTRIGGERS_STATE_REGISTERED) {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0mutex_unlock(&udev->mutex);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0return -EINVAL;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0udev->trig_delay_on =3D=
 0u;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0udev->trig_delay_off =
=3D 0u;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0udev->brightness =3D bl=
ink_oneshot.invert ? LED_FULL : LED_OFF;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0udev->trig_state =3D TR=
IG_STATE_EVENT;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0led_trigger_blink_onesh=
ot(&udev->led_trigger, blink_oneshot.delay_on, blink_oneshot.delay_off, bli=
nk_oneshot.invert);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&udev->mut=
ex);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0default:=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0retval =3D -ENOIOCTLCMD=
;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0}=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0return retval;=20
 > +}=20
 > +=20
 > +static int uledtriggers_release(struct inode *inode, struct file *file)=
=20
 > +{=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0struct uledtriggers_device *udev =3D file->priv=
ate_data;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0if (udev->state =3D=3D ULEDTRIGGERS_STATE_REGIS=
TERED) {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0udev->state =3D ULEDTRI=
GGERS_STATE_UNKNOWN;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0led_trigger_unregister(=
&udev->led_trigger);=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0}=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0kfree(udev);=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0return 0;=20
 > +}=20
 > +=20
 > +static const struct file_operations uledtriggers_fops =3D {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0.owner=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=3D THIS_MODULE,=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0.open=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=3D uledtriggers_open,=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0.release=C2=A0=C2=A0=C2=A0=C2=A0=3D uledtrigger=
s_release,=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0.write=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=3D uledtriggers_write,=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0.unlocked_ioctl=C2=A0=C2=A0=C2=A0=C2=A0=3D uled=
triggers_ioctl,=20
 > +};=20
 > +=20
 > +static struct miscdevice uledtriggers_misc =3D {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0.fops=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=3D &uledtriggers_fops,=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0.minor=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=3D MISC_DYNAMIC_MINOR,=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0.name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=3D ULEDTRIGGERS_NAME,=20
 > +};=20
 > +=20
 > +module_misc_device(uledtriggers_misc);=20
 > +=20
 > +MODULE_AUTHOR("Craig McQueen craig@mcqueen.au>");=20
 > +MODULE_DESCRIPTION("Userspace LED triggers driver");=20
 > +MODULE_LICENSE("GPL");=20
 > diff --git a/include/uapi/linux/uledtriggers.h b/include/uapi/linux/uled=
triggers.h=20
 > new file mode 100644=20
 > index 000000000000..251fa0a31861=20
 > --- /dev/null=20
 > +++ b/include/uapi/linux/uledtriggers.h=20
 > @@ -0,0 +1,123 @@=20
 > +/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */=20
 > +/*=20
 > + * Userspace LED triggers driver support=20
 > + *=20
 > + * This program is free software; you can redistribute it and/or modify=
=20
 > + * it under the terms of the GNU General Public License as published by=
=20
 > + * the Free Software Foundation; either version 2 of the License, or=20
 > + * (at your option) any later version.=20
 > + *=20
 > + * This program is distributed in the hope that it will be useful,=20
 > + * but WITHOUT ANY WARRANTY; without even the implied warranty of=20
 > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=20
 > + * GNU General Public License for more details.=20
 > + */=20
 > +#ifndef _UAPI__ULEDTRIGGERS_H_=20
 > +#define _UAPI__ULEDTRIGGERS_H_=20
 > +=20
 > +/* See TRIG_NAME_MAX in linux/leds.h */=20
 > +#define LED_TRIGGER_MAX_NAME_SIZE=C2=A0=C2=A0=C2=A0=C2=A050=20
 > +=20
 > +/*=20
 > + * Struct for initial write to setup, or ioctl ULEDTREGGERS_IOC_DEV_SET=
UP.=20
 > + */=20
 > +struct uledtriggers_user_dev {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0char name[LED_TRIGGER_MAX_NAME_SIZE];=20
 > +};=20
 > +=20
 > +/*=20
 > + * Brightness levels for writes of int values, or for use with ULEDTRIG=
GERS_IOC_EVENT.=20
 > + * These correspond to Linux kernel internal enum led_brightness in lin=
ux/leds.h.=20
 > + */=20
 > +enum uledtriggers_brightness {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0ULEDTRIGGERS_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=3D 0,=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0ULEDTRIGGERS_ON=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D 1,=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0ULEDTRIGGERS_HALF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=3D 127,=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0ULEDTRIGGERS_FULL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=3D 255,=20
 > +};=20
 > +=20
 > +/*=20
 > + * Struct for ioctl ULEDTRIGGERS_IOC_BLINK.=20
 > + */=20
 > +struct uledtriggers_blink {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0unsigned long delay_on;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0unsigned long delay_off;=20
 > +};=20
 > +=20
 > +/*=20
 > + * Struct for ioctl ULEDTRIGGERS_IOC_BLINK_ONESHOT.=20
 > + * Note padding at the end due to alignment (for 64-bit kernels). Ensur=
e it's set to 0.=20
 > + */=20
 > +struct uledtriggers_blink_oneshot {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0unsigned long delay_on;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0unsigned long delay_off;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0int invert;=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0int __unused;=20
 > +};=20
 > +=20
 > +=20
 > +/* ioctl commands */=20
 > +=20
 > +#define ULEDTRIGGERS_IOC_MAGIC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0't'=20
 > +=20
 > +/*=20
 > + * Initial setup.=20
 > + * E.g.:=20
 > + *=C2=A0=C2=A0=C2=A0=C2=A0int retval;=20
 > + *=C2=A0=C2=A0=C2=A0=C2=A0struct uledtriggers_user_dev dev_setup =3D { =
"transmogrifier" };=20
 > + *=C2=A0=C2=A0=C2=A0=C2=A0retval =3D ioctl(fd, ULEDTRIGGERS_IOC_DEV_SET=
UP, &dev_setup);=20
 > + */=20
 > +#define ULEDTRIGGERS_IOC_DEV_SETUP=C2=A0=C2=A0=C2=A0=C2=A0_IOW(ULEDTRIG=
GERS_IOC_MAGIC, 0x01, struct uledtriggers_user_dev)=20
 > +=20
 > +/*=20
 > + * Turn the trigger off.=20
 > + * E.g.:=20
 > + *=C2=A0=C2=A0=C2=A0=C2=A0int retval;=20
 > + *=C2=A0=C2=A0=C2=A0=C2=A0retval =3D ioctl(fd, ULEDTRIGGERS_IOC_OFF);=
=20
 > + */=20
 > +#define ULEDTRIGGERS_IOC_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0_IO(ULEDTRIGGERS_IOC_MAGIC, 0x10)=20
 > +=20
 > +/*=20
 > + * Turn the trigger on.=20
 > + * E.g.:=20
 > + *=C2=A0=C2=A0=C2=A0=C2=A0int retval;=20
 > + *=C2=A0=C2=A0=C2=A0=C2=A0retval =3D ioctl(fd, ULEDTRIGGERS_IOC_ON);=20
 > + */=20
 > +#define ULEDTRIGGERS_IOC_ON=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0_IO(ULEDTRIGGERS_IOC_MAGIC, 0x11)=20
 > +=20
 > +/*=20
 > + * Set the LED trigger to a specified brightness.=20
 > + * Refer to enum uledtriggers_brightness.=20
 > + * E.g.:=20
 > + *=C2=A0=C2=A0=C2=A0=C2=A0int retval;=20
 > + *=C2=A0=C2=A0=C2=A0=C2=A0int brightness =3D ULEDTRIGGERS_FULL;=20
 > + *=C2=A0=C2=A0=C2=A0=C2=A0retval =3D ioctl(fd, ULEDTRIGGERS_IOC_EVENT, =
&brightness);=20
 > + */=20
 > +#define ULEDTRIGGERS_IOC_EVENT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0_IOW(ULEDTRIGGERS_IOC_MAGIC, 0x12, int)=20
 > +=20
 > +/*=20
 > + * Set the LED trigger to blink continuously.=20
 > + * E.g.:=20
 > + *=C2=A0=C2=A0=C2=A0=C2=A0int retval;=20
 > + *=C2=A0=C2=A0=C2=A0=C2=A0struct uledtriggers_blink blink;=20
 > + *      blink.delay_on =3D 100;=20
 > + *      blink.delay_off =3D 400;=20
 > + *=C2=A0=C2=A0=C2=A0=C2=A0retval =3D ioctl(fd, ULEDTRIGGERS_IOC_BLINK, =
&blink);=20
 > + */=20
 > +#define ULEDTRIGGERS_IOC_BLINK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0_IOW(ULEDTRIGGERS_IOC_MAGIC, 0x20, struct uledtriggers_blink)=20
 > +=20
 > +/*=20
 > + * Set the LED trigger to blink once.=20
 > + * E.g.:=20
 > + *=C2=A0=C2=A0=C2=A0=C2=A0int retval;=20
 > + *=C2=A0=C2=A0=C2=A0=C2=A0struct uledtriggers_blink_oneshot blink_onesh=
ot;=20
 > + *      blink_oneshot.delay_on =3D 100;=20
 > + *      blink_oneshot.delay_off =3D 400;=20
 > + *      blink_oneshot.invert =3D false;=20
 > + *      blink_oneshot.__unused =3D 0;=20
 > + *=C2=A0=C2=A0=C2=A0=C2=A0retval =3D ioctl(fd, ULEDTRIGGERS_IOC_BLINK_O=
NESHOT, &blink_oneshot);=20
 > + */=20
 > +#define ULEDTRIGGERS_IOC_BLINK_ONESHOT=C2=A0=C2=A0=C2=A0=C2=A0_IOW(ULED=
TRIGGERS_IOC_MAGIC, 0x21, struct uledtriggers_blink_oneshot)=20
 > +=20
 > +=20
 > +#endif /* _UAPI__ULEDTRIGGERS_H_ */=20
 > --=20
 > 2.48.1=20
 > =20
 > =20
 >=20


