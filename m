Return-Path: <linux-leds+bounces-171-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCDB7F9B8E
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 09:19:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C4D8B20A6A
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 08:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9831911717;
	Mon, 27 Nov 2023 08:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-leds@vger.kernel.org
Received: from mxout70.expurgate.net (mxout70.expurgate.net [91.198.224.70])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C29418C;
	Mon, 27 Nov 2023 00:19:10 -0800 (PST)
Received: from [127.0.0.1] (helo=localhost)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <prvs=1709d64187=fe@dev.tdt.de>)
	id 1r7Wpb-004jzT-9Q; Mon, 27 Nov 2023 09:19:03 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <fe@dev.tdt.de>)
	id 1r7Wpa-00GWX1-Fy; Mon, 27 Nov 2023 09:19:02 +0100
Received: from securemail.tdt.de (localhost [127.0.0.1])
	by securemail.tdt.de (Postfix) with ESMTP id 17211240049;
	Mon, 27 Nov 2023 09:19:02 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
	by securemail.tdt.de (Postfix) with ESMTP id 6C427240040;
	Mon, 27 Nov 2023 09:19:01 +0100 (CET)
Received: from mail.dev.tdt.de (localhost [IPv6:::1])
	by mail.dev.tdt.de (Postfix) with ESMTP id DCF7E33D23;
	Mon, 27 Nov 2023 09:19:00 +0100 (CET)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Mon, 27 Nov 2023 09:19:00 +0100
From: Florian Eckert <fe@dev.tdt.de>
To: Lee Jones <lee@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Eckert.Florian@googlemail.com,
 jirislaby@kernel.org, pavel@ucw.cz, kabel@kernel.org,
 u.kleine-koenig@pengutronix.de, m.brock@vanmierlo.com,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-leds@vger.kernel.org
Subject: Re: [Patch v8 2/6] leds: ledtrig-tty: free allocated ttyname buffer
 on deactivate
In-Reply-To: <20231127080436.GA1470173@google.com>
References: <20231109085038.371977-1-fe@dev.tdt.de>
 <20231109085038.371977-3-fe@dev.tdt.de>
 <2023112356-amount-undertook-cdb2@gregkh>
 <71eeb0fad7c6d2c4a407df34facee232@dev.tdt.de>
 <20231127080436.GA1470173@google.com>
Message-ID: <65443ec1eef4251a0b68a9314408e4a8@dev.tdt.de>
X-Sender: fe@dev.tdt.de
User-Agent: Roundcube Webmail/1.3.17
Content-Transfer-Encoding: quoted-printable
X-purgate-type: clean
X-purgate: clean
X-purgate-ID: 151534::1701073143-E0F2E49D-F91FDBC9/0/0



On 2023-11-27 09:04, Lee Jones wrote:
> On Mon, 27 Nov 2023, Florian Eckert wrote:
>=20
>>=20
>>=20
>> On 2023-11-23 15:06, Greg KH wrote:
>> > On Thu, Nov 09, 2023 at 09:50:34AM +0100, Florian Eckert wrote:
>> > > The ttyname buffer for the ledtrig_tty_data struct is allocated in=
 the
>> > > sysfs ttyname_store() function. This buffer must be released on
>> > > trigger
>> > > deactivation. This was missing and is thus a memory leak.
>> > >
>> > > While we are at it, the tty handler in the ledtrig_tty_data struct
>> > > should
>> > > also be returned in case of the trigger deactivation call.
>> > >
>> > > Fixes: fd4a641ac88f ("leds: trigger: implement a tty trigger")
>> > > Reviewed-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de=
>
>> > > Signed-off-by: Florian Eckert <fe@dev.tdt.de>
>> > > ---
>> > >  drivers/leds/trigger/ledtrig-tty.c | 4 ++++
>> > >  1 file changed, 4 insertions(+)
>> > >
>> > > diff --git a/drivers/leds/trigger/ledtrig-tty.c
>> > > b/drivers/leds/trigger/ledtrig-tty.c
>> > > index 8ae0d2d284af..3e69a7bde928 100644
>> > > --- a/drivers/leds/trigger/ledtrig-tty.c
>> > > +++ b/drivers/leds/trigger/ledtrig-tty.c
>> > > @@ -168,6 +168,10 @@ static void ledtrig_tty_deactivate(struct
>> > > led_classdev *led_cdev)
>> > >
>> > >  	cancel_delayed_work_sync(&trigger_data->dwork);
>> > >
>> > > +	kfree(trigger_data->ttyname);
>> > > +	tty_kref_put(trigger_data->tty);
>> > > +	trigger_data->tty =3D NULL;
>> > > +
>> >
>> > This should be a stand-alone patch with a proper cc: stable tag adde=
d as
>> > well so that it can be accepted now, as it is independent of this ne=
w
>> > feature you are adding.
>>=20
>> I already send this to stable@vger.kernel.org [1].
>> The patch already got an 'Reviewed-by:' from Uwe [2].
>=20
> But then you posted this submission which superseded it in my inbox.
>=20
> Only the latest patch will be processed when this happens.

Thanks for the clarification, I wasn't aware of that.

>=20
>> I hope I did everything right and it only slipped through?
>>=20
>> I will omit the patch from the v9 patchset of 'ledtrig-tty'.
>> This patch set will come later today with your requested changes.
>>=20
>> Links;
>> [1]=20
>> https://lore.kernel.org/stable/20231106141205.3376954-1-fe@dev.tdt.de/
>> [2]=20
>> https://lore.kernel.org/stable/20231106144914.bflq2jxejdxs6zjb@pengutr=
onix.de/
>>=20
>> Best regards
>>=20
>> Florian

