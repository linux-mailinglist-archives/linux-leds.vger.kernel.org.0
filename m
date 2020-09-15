Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3576F26A1DA
	for <lists+linux-leds@lfdr.de>; Tue, 15 Sep 2020 11:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726235AbgIOJPD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 15 Sep 2020 05:15:03 -0400
Received: from mail.thorsis.com ([92.198.35.195]:60802 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726208AbgIOJPB (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 15 Sep 2020 05:15:01 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 22E4748D0;
        Tue, 15 Sep 2020 11:14:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id WAfUJ7UoPqon; Tue, 15 Sep 2020 11:14:56 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id E7B454856; Tue, 15 Sep 2020 11:14:55 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.2
From:   Alexander Dahl <ada@thorsis.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Alexander Dahl <post@lespocky.de>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v4 1/3] leds: Require valid fwnode pointer for composing name
Date:   Tue, 15 Sep 2020 11:14:49 +0200
Message-ID: <2642665.8NmDdnWKvZ@ada>
In-Reply-To: <6652b897-5044-713b-6f06-83d07be0dba7@gmail.com>
References: <20200911154004.28354-1-post@lespocky.de> <20200911154004.28354-2-post@lespocky.de> <6652b897-5044-713b-6f06-83d07be0dba7@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Jacek,

thanks for your feedback. See below.

Am Freitag, 11. September 2020, 23:26:43 CEST schrieb Jacek Anaszewski:
> On 9/11/20 5:40 PM, Alexander Dahl wrote:
> > The function 'led_compose_name()' is called in
> > 'led_classdev_register_ext(()' only and in its implementation it always
> > parses the fwnode passed with the init_data struct.  If there's no
> > fwnode, EINVAL is returned and 'led_classdev_register_ext()' returns
> > early.
> >=20
> > If this is detected early the same fallback mechanism can be used , as
> > if init_data itself is NULL.  This will allow drivers to pass fully
> > populated 'init_data' or sparse initialized 'init_data' with a NULL
> > fwnode in a more elegant way with only one function call.
> >=20
> > Fixes: bb4e9af0348d ("leds: core: Add support for composing LED class
> > device names") Suggested-by: Pavel Machek <pavel@ucw.cz>
> > Signed-off-by: Alexander Dahl <post@lespocky.de>
> > ---
> >=20
> > Notes:
> >      v4:
> >        * added this patch to series (Suggested-by: Pavel Machek)
> >  =20
> >   drivers/leds/led-class.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > index cc3929f858b6..3da50c7ecfe7 100644
> > --- a/drivers/leds/led-class.c
> > +++ b/drivers/leds/led-class.c
> > @@ -346,7 +346,7 @@ int led_classdev_register_ext(struct device *parent,
> >=20
> >   	const char *proposed_name =3D composed_name;
> >   	int ret;
> >=20
> > -	if (init_data) {
> > +	if (init_data && init_data->fwnode) {
>=20
> This does not cover the case when we don't have fwnode but we
> have init_data->default_label that led_compose_name() can make use of.
>=20
> >   		if (init_data->devname_mandatory && !init_data->devicename) {
> >   	=09
> >   			dev_err(parent, "Mandatory device name is missing");
> >   			return -EINVAL;

You're right, I missed that part in that if/else if construct in=20
led_compose_name() =E2=80=A6 I looked at the code for some more time now an=
d could not=20
come up with an elegant change to the led-core or led-class. :-/

However I also had another look at leds-pwm and for me it seems that it is=
=20
used by fwnode (DT, ACPI, ??) based devices only.  I could not find a singl=
e=20
user of leds-pwm as a platform driver, which is probably why 141f15c66d94=20
("leds: pwm: remove header") was possible?

I had a look at the history of the leds-pwm driver and when introduced in 2=
009=20
platform based board files where a thing, no dt, of, or fwnode yet, at leas=
t=20
for arm, right?  Device tree support for leds-pwm was added in 2012 by Pete=
r=20
Ujfalusi.

So if those code paths in leds-pwm are not used anymore, what about droppin=
g=20
that platform support in leds-pwm driver?  That would mean we always have=20
fwnode non-null and would not require a change in led-class at all?

Greets
Alex



