Return-Path: <linux-leds+bounces-235-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DCD801658
	for <lists+linux-leds@lfdr.de>; Fri,  1 Dec 2023 23:32:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BCB31C20A1B
	for <lists+linux-leds@lfdr.de>; Fri,  1 Dec 2023 22:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB50163;
	Fri,  1 Dec 2023 22:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f3XrU8Xs"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 105AF10EA;
	Fri,  1 Dec 2023 14:32:29 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a1a0fedd3a1so159952766b.1;
        Fri, 01 Dec 2023 14:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701469947; x=1702074747; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P2Cjaqm2B2KqhRkLdZrI/ySchU5JoTmFk05u+/d5W5g=;
        b=f3XrU8Xs/4bC7pGksQq9WtiyZJkXXPloAyy8n9zdGe24fX2/DPExo3eMgwPYYINkst
         DpWtAXzJjctcjw7avi6eJcozZ1xgewspJuDLIkDH2Uhn5Sl48L94JeyRPSeT6yeu5d8p
         QMtCrDnE+D7tAv9jfEjygnEVKE5scsJHdnHf2TfN4VS3UMRyF8uRJjiDIaha9tpw+wPP
         zPsIsod05bM7No8Xxt5kKSXM0b+VYi/Z9md06AFmmjpOEEWRYCebLI69kVjmgZzTxwbF
         movySc20fhMrES7SUndmGYhNK/h29Ra/FrBbr6g7Wmy62KvsyjtW7humAuGoBr5e1b5Y
         6DFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701469947; x=1702074747;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P2Cjaqm2B2KqhRkLdZrI/ySchU5JoTmFk05u+/d5W5g=;
        b=qxsQXrSROw2nFxRnhe22VzRFTpEJWXVkXed8EyG66aiDXQ0ZjD2x8e4Qxd/yZWRKjm
         9yLpZ2GItsAM12szDYSTHvYnNyYD86DRg8IFWOGmCm4wyJefeIv/vNJJv/Bablz12fit
         InGXU6d3VXBajkjo+RLx619YqfW2Kv9jtRNQzE9bCUojBgE44NxQjYJ0WMWjwIqPuz12
         6vtsaDDQvFg2RVDtk0Q/Ni43dscqGrbjuMxez5klDtpS+Wn/HhnRPoU3wiV8vFVrOgaE
         sJNVgfbOn/OElkeHeLsE6ax7vNyyrt8inUS+skKq4Fs6LmWhQNs42ntv5H6czcp1/Gw/
         NLuA==
X-Gm-Message-State: AOJu0YwtEZ6PdXxp4NfEpJJJDYERIW/Fg8p48BQI0mAP4l04S2x4QJ3W
	1EM0SrZIeUNIFwi/yreKddI=
X-Google-Smtp-Source: AGHT+IEXTI5G6v0TNGZWrRa80eWVIjiFdadkD+a3z+io6l7c8N/yhnoaHG5V9iWP0US2mkXoKsD6Eg==
X-Received: by 2002:a17:906:f10f:b0:a19:12d5:b724 with SMTP id gv15-20020a170906f10f00b00a1912d5b724mr2292973ejb.57.1701469947261;
        Fri, 01 Dec 2023 14:32:27 -0800 (PST)
Received: from ?IPV6:2a01:c22:7a3c:af00:b8b0:b422:4388:5428? (dynamic-2a01-0c22-7a3c-af00-b8b0-b422-4388-5428.c22.pool.telefonica.de. [2a01:c22:7a3c:af00:b8b0:b422:4388:5428])
        by smtp.googlemail.com with ESMTPSA id w17-20020a170906481100b009fad1dfe472sm2360082ejq.153.2023.12.01.14.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 14:32:26 -0800 (PST)
Message-ID: <c57558a4-9f3a-48fa-acb7-e3eb2349c666@gmail.com>
Date: Fri, 1 Dec 2023 23:32:27 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: trigger: netdev: skip setting baseline state in
 activate if hw-controlled
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Christian Marangi <ansuelsmth@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <49f1b91e-a637-4062-83c6-f851f7c80628@gmail.com>
 <a69ebe41-3f37-4988-a0bc-e53f79df27f2@lunn.ch>
 <CAFSsGVvBfvkotAd+p++bzca4Km8pHVzNJEGV6CAjYULVOWuD2Q@mail.gmail.com>
 <7535cb07-31ab-407d-9226-7b3f65050a65@lunn.ch>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <7535cb07-31ab-407d-9226-7b3f65050a65@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.11.2023 23:02, Andrew Lunn wrote:
>> RTL8168 LED control allows to switch between different hw triggers. I
>> was under the
>> assumption that this is not uncommon.
> 
> I did take a look around various datasheets, and i did find a couple
> like this, but the majority have the ability to do software control.
> 
>> In order to deal with the non-atomic issue we have to set
>> trigger_data->mode to the
>> resulting new mode, based on what the user set. Question is what we show to the
>> user. If we show nothing, then he will expect the new mode to be active.
>> If we show an error, then he may assume that his input had no effect.
>> So we may have to show technically an OK, plus a message that his input has been
>> stored, but is not supported by hw.
> 
> It is hard to show anything to the user. We are just doing
> 
> echo 1 > file.
> 
> There is no channel to the user other than an error code.
> 
> There is also the question about what the LED should show. Ideally it
> should indicate some sort of state to indicate there is an
> error. Either constantly blink, turn off, etc. Maybe that is the
> solution. You implement a set_brightness function which just indicates
> an error on the LED, but otherwise return O.K?
> 
Let's take a very simple use case: We have a one bit configuration to
switch a LED between link_100 and link_1000 hw trigger mode.

Then we have the atomicity issue you described: We can't go directly
from one hw-controlled mode to the other, we have to go via both
modes active or no mode active.

And unfortunately we don't have the option to indicate this by some
optical LED activity like blinking, especially if the link is down
at the moment.

Would be a pity if our nice framework can't support such a simple
use case. So, what I could imagine, we react based on the return code
from hw_control_is_supported():

- 0: use hw control
- -EOPNOTSUPP: fall back to LED software control, no error returned to use
- -ENOTSUPP (another idea: ENOEXEC): store new mode in trigger_data->mode and return error to the user
- other errors: don't store new mode and return error to user

Not fully intuitive and the subtle difference between EOPNOTSUPP and
ENOTSUPP may confuse driver authors adding device LED support.
However for the user it should be ok, he always has the option to read
back the attribute in order to check whether new mode has been stored.
That's the best I can see so far.

>    Andrew

Heiner

