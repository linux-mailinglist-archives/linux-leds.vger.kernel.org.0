Return-Path: <linux-leds+bounces-47-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4D17F2670
	for <lists+linux-leds@lfdr.de>; Tue, 21 Nov 2023 08:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8113281782
	for <lists+linux-leds@lfdr.de>; Tue, 21 Nov 2023 07:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DDFC2232D;
	Tue, 21 Nov 2023 07:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-leds@vger.kernel.org
Received: from mxout70.expurgate.net (mxout70.expurgate.net [194.37.255.70])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DDCDB9;
	Mon, 20 Nov 2023 23:35:28 -0800 (PST)
Received: from [127.0.0.1] (helo=localhost)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <prvs=0703440f32=fe@dev.tdt.de>)
	id 1r5LHu-00EQkE-6R; Tue, 21 Nov 2023 08:35:14 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <fe@dev.tdt.de>)
	id 1r5LHt-00GH9Z-4o; Tue, 21 Nov 2023 08:35:13 +0100
Received: from securemail.tdt.de (localhost [127.0.0.1])
	by securemail.tdt.de (Postfix) with ESMTP id BC857240049;
	Tue, 21 Nov 2023 08:35:12 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
	by securemail.tdt.de (Postfix) with ESMTP id 18521240040;
	Tue, 21 Nov 2023 08:35:12 +0100 (CET)
Received: from mail.dev.tdt.de (localhost [IPv6:::1])
	by mail.dev.tdt.de (Postfix) with ESMTP id 9BDCA33A3D;
	Tue, 21 Nov 2023 08:35:11 +0100 (CET)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 21 Nov 2023 08:35:11 +0100
From: Florian Eckert <fe@dev.tdt.de>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Eckert.Florian@googlemail.com, gregkh@linuxfoundation.org, pavel@ucw.cz,
 lee@kernel.org, kabel@kernel.org, u.kleine-koenig@pengutronix.de,
 m.brock@vanmierlo.com, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [Patch v8 1/6] tty: add new helper function tty_get_tiocm
In-Reply-To: <1b89d7df-2511-4b3e-ab35-071734fb413c@kernel.org>
References: <20231109085038.371977-1-fe@dev.tdt.de>
 <20231109085038.371977-2-fe@dev.tdt.de>
 <1b89d7df-2511-4b3e-ab35-071734fb413c@kernel.org>
Message-ID: <ac57ff244b252df3c70387c61d34884d@dev.tdt.de>
X-Sender: fe@dev.tdt.de
User-Agent: Roundcube Webmail/1.3.17
X-purgate-ID: 151534::1700552113-D1E98639-88650825/0/0
X-purgate: clean
X-purgate-type: clean



On 2023-11-20 08:21, Jiri Slaby wrote:
> On 09. 11. 23, 9:50, Florian Eckert wrote:
>> There is no in-kernel function to get the status register of a tty 
>> device
>> like the TIOCMGET ioctl returns to userspace. Create a new function,
>> tty_get_tiocm(), to obtain the status register that other portions of 
>> the
>> kernel can call if they need this information, and move the existing
>> internal tty_tiocmget() function to use this interface.
>> 
>> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Signed-off-by: Florian Eckert <fe@dev.tdt.de>
>> ---
>>   drivers/tty/tty_io.c | 28 ++++++++++++++++++++++------
>>   include/linux/tty.h  |  1 +
>>   2 files changed, 23 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
>> index 06414e43e0b5..e2e93404133e 100644
>> --- a/drivers/tty/tty_io.c
>> +++ b/drivers/tty/tty_io.c
>> @@ -2498,6 +2498,24 @@ static int send_break(struct tty_struct *tty, 
>> unsigned int duration)
>>   	return retval;
>>   }
>>   +/**
>> + * tty_get_tiocm - get tiocm status register
>> + * @tty: tty device
>> + *
>> + * Obtain the modem status bits from the tty driver if the feature
>> + * is supported.
>> + */
>> +int tty_get_tiocm(struct tty_struct *tty)
>> +{
>> +	int retval = -ENOTTY;
>> +
>> +	if (tty->ops->tiocmget)
>> +		retval = tty->ops->tiocmget(tty);
>> +
>> +	return retval;
> 
> Why not simply:

I just did it this way because it is also done this way in other 
functions
in this file.

> {
>  if (tty->ops->tiocmget)
>     return tty->ops->tiocmget(tty);
> 
>  return -ENOTTY;
> }

Of course, we could also do it this way. If this is the C style for the 
kernel,
then I will change it. Please give me a short feedback whether I should 
change it
and send a v9, or whether it is just a comment from you.

Best regards

Florian


