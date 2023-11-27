Return-Path: <linux-leds+bounces-167-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B94F77F9A9C
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 08:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 732D6280CD8
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 07:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE73DF6D;
	Mon, 27 Nov 2023 07:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-leds@vger.kernel.org
Received: from mxout70.expurgate.net (mxout70.expurgate.net [91.198.224.70])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C089D13E;
	Sun, 26 Nov 2023 23:13:28 -0800 (PST)
Received: from [127.0.0.1] (helo=localhost)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <prvs=1709d64187=fe@dev.tdt.de>)
	id 1r7Vnx-0045BN-4D; Mon, 27 Nov 2023 08:13:17 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <fe@dev.tdt.de>)
	id 1r7Vnv-00GDYD-QO; Mon, 27 Nov 2023 08:13:15 +0100
Received: from securemail.tdt.de (localhost [127.0.0.1])
	by securemail.tdt.de (Postfix) with ESMTP id 5FB2124004B;
	Mon, 27 Nov 2023 08:13:15 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
	by securemail.tdt.de (Postfix) with ESMTP id AE144240040;
	Mon, 27 Nov 2023 08:13:14 +0100 (CET)
Received: from mail.dev.tdt.de (localhost [IPv6:::1])
	by mail.dev.tdt.de (Postfix) with ESMTP id F187133D23;
	Mon, 27 Nov 2023 08:13:13 +0100 (CET)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Mon, 27 Nov 2023 08:13:13 +0100
From: Florian Eckert <fe@dev.tdt.de>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Eckert.Florian@googlemail.com, jirislaby@kernel.org, pavel@ucw.cz,
 lee@kernel.org, kabel@kernel.org, u.kleine-koenig@pengutronix.de,
 m.brock@vanmierlo.com, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [Patch v8 2/6] leds: ledtrig-tty: free allocated ttyname buffer
 on deactivate
In-Reply-To: <2023112356-amount-undertook-cdb2@gregkh>
References: <20231109085038.371977-1-fe@dev.tdt.de>
 <20231109085038.371977-3-fe@dev.tdt.de>
 <2023112356-amount-undertook-cdb2@gregkh>
Message-ID: <71eeb0fad7c6d2c4a407df34facee232@dev.tdt.de>
X-Sender: fe@dev.tdt.de
User-Agent: Roundcube Webmail/1.3.17
Content-Transfer-Encoding: quoted-printable
X-purgate-type: clean
X-purgate: clean
X-purgate-ID: 151534::1701069196-E2F2A49D-09E08CA6/0/0



On 2023-11-23 15:06, Greg KH wrote:
> On Thu, Nov 09, 2023 at 09:50:34AM +0100, Florian Eckert wrote:
>> The ttyname buffer for the ledtrig_tty_data struct is allocated in the
>> sysfs ttyname_store() function. This buffer must be released on=20
>> trigger
>> deactivation. This was missing and is thus a memory leak.
>>=20
>> While we are at it, the tty handler in the ledtrig_tty_data struct=20
>> should
>> also be returned in case of the trigger deactivation call.
>>=20
>> Fixes: fd4a641ac88f ("leds: trigger: implement a tty trigger")
>> Reviewed-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>> Signed-off-by: Florian Eckert <fe@dev.tdt.de>
>> ---
>>  drivers/leds/trigger/ledtrig-tty.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>=20
>> diff --git a/drivers/leds/trigger/ledtrig-tty.c=20
>> b/drivers/leds/trigger/ledtrig-tty.c
>> index 8ae0d2d284af..3e69a7bde928 100644
>> --- a/drivers/leds/trigger/ledtrig-tty.c
>> +++ b/drivers/leds/trigger/ledtrig-tty.c
>> @@ -168,6 +168,10 @@ static void ledtrig_tty_deactivate(struct=20
>> led_classdev *led_cdev)
>>=20
>>  	cancel_delayed_work_sync(&trigger_data->dwork);
>>=20
>> +	kfree(trigger_data->ttyname);
>> +	tty_kref_put(trigger_data->tty);
>> +	trigger_data->tty =3D NULL;
>> +
>=20
> This should be a stand-alone patch with a proper cc: stable tag added=20
> as
> well so that it can be accepted now, as it is independent of this new
> feature you are adding.

I already send this to stable@vger.kernel.org [1].
The patch already got an 'Reviewed-by:' from Uwe [2].
I hope I did everything right and it only slipped through?

I will omit the patch from the v9 patchset of 'ledtrig-tty'.
This patch set will come later today with your requested changes.

Links;
[1]=20
https://lore.kernel.org/stable/20231106141205.3376954-1-fe@dev.tdt.de/
[2]=20
https://lore.kernel.org/stable/20231106144914.bflq2jxejdxs6zjb@pengutroni=
x.de/

Best regards

Florian

