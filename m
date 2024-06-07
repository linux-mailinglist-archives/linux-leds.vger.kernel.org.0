Return-Path: <linux-leds+bounces-1864-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7847C9008CF
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2024 17:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 919051C218F9
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2024 15:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92746195808;
	Fri,  7 Jun 2024 15:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YCRwHKr+"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD11A182D8
	for <linux-leds@vger.kernel.org>; Fri,  7 Jun 2024 15:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717774016; cv=none; b=KaCnSnhL51Lp9u1GfYrAjUY7ZskTyItUbk2El5OVnW5FPBXMv8b5DHBv5Cxu8bhdF+5HiQVTEtkxOaqyNDoN5EeW3d/swBckFzgqo6/TdrRH+dNYS0nY7p0ksHwHTG6aLRJZNKdW9NvqIkNIR9r0VDoW1EASivuXyl+vdIH6944=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717774016; c=relaxed/simple;
	bh=rOfg24Dcz8QAnnEvfYvkHk1NUSiHhQLDhQ0iBZ8jknA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VixyA3X6qTjxgdR1/u3fRksReRnihzjGAHpYBeTdY0lD2lXJPDV6OXFxmyeU5mxZ4Y3fIClziWD77sZ5vn5k3bzUEY3gBRMwBhOTTOHLSfJFmzDbE6M/A1hL9BZNGAX/nmjDnfEfFDHkxR7CMPdqnwIuBb98ivB2lmYjsrV0Xa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YCRwHKr+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717774013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9D/A+3bwK+p1bXr6ecFnn0y362Acz3/hUX82Z0aoQCc=;
	b=YCRwHKr+KpwEZEayUa8fxs8eJcUkuYitWKE10wC+x1inhzucKNXtSzu4hAIJBLB8oajPxB
	gl++dAMCbLvd/qI4OgZ5FnrDcJ8PmlcqNrYbPEwITaw3v65HWw/d6iltH7Icg/M1J59LbZ
	rRSFjgFCVWDEsKDEvKvZBx1ItjXd3xY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-vOrSp6GrMx2rbfUGptgeuQ-1; Fri, 07 Jun 2024 11:26:52 -0400
X-MC-Unique: vOrSp6GrMx2rbfUGptgeuQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-57a1c680aa8so883652a12.0
        for <linux-leds@vger.kernel.org>; Fri, 07 Jun 2024 08:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717774011; x=1718378811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9D/A+3bwK+p1bXr6ecFnn0y362Acz3/hUX82Z0aoQCc=;
        b=ql53DkhClumyZFaP+oQ+gNVWamdOsuYKE5UTmK3AQn9L7qQ4NWFXpNsvcXAxH1ubWh
         Ck1U8S8nEbRxkEEDiMhF6sNEMRp0jpZgAzQ72ueIo9EGV5PjGouFvp2SV5QyITvFVWdl
         rzn08smZ+tzyC41wX0uObtI0Nhp3AU8agju2cYipW1igKw05rXEXvPV7MuDq2GUPKefW
         /hoGcb+FXKGP86o+Mw97NdrlUfKpOlsOrr7L1xlu/r+I1RVRs3fdVl2X6W8TUzGhu1Db
         xlw7jJUvJy7YumBQdLgPwy+2QD0cxfTiQKeamgazjCpWqNaUYr/GhOdl6Ezsl4nu/EVC
         kxJw==
X-Forwarded-Encrypted: i=1; AJvYcCXXyInHCjYbQGs0mwYCSwhBa2HSM0oXkVPFrjG7wNO4Amj8PNnHNPXyIZtPKzUtMOuKoKh0LKqCcmG5F0z0RglFS95YaiOUp/CqcQ==
X-Gm-Message-State: AOJu0YzuZwLW8NvZdpFFC9ubU8HET3xJpQOEJjPiJ382AxIELRN4rqWp
	8rqsHFwXSpqPhahDj697ksQ4URiTvmuHTGMdOGMq4jl+5JXUSqEFgJNqbCtExyYVVmPKbLurE00
	R7XO5vfj+uAIp3oUgnkxRPzv1q2NYJj+K6fSWxPi7lYF9ICpOjzuPf3idYTA=
X-Received: by 2002:a50:d69b:0:b0:57c:6234:e95b with SMTP id 4fb4d7f45d1cf-57c6234e9acmr471791a12.5.1717774011356;
        Fri, 07 Jun 2024 08:26:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0/6f7Ed+Q3P9FkVIMtn8/uS5MhDHOHU8/MO14CZu0SSWzQQpCvt+kzKfAK1hlK24ChuIRgQ==
X-Received: by 2002:a50:d69b:0:b0:57c:6234:e95b with SMTP id 4fb4d7f45d1cf-57c6234e9acmr471784a12.5.1717774010889;
        Fri, 07 Jun 2024 08:26:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aadfa3c47sm2925666a12.16.2024.06.07.08.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 08:26:50 -0700 (PDT)
Message-ID: <7a73693e-87b4-4161-a058-4e36f50e1376@redhat.com>
Date: Fri, 7 Jun 2024 17:26:49 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: class: Revert: "If no default trigger is given,
 make hw_control trigger the default trigger"
To: Andrew Lunn <andrew@lunn.ch>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 regressions@lists.linux.dev, linux-leds@vger.kernel.org,
 Genes Lists <lists@sapience.com>, =?UTF-8?Q?Johannes_W=C3=BCller?=
 <johanneswueller@gmail.com>, stable@vger.kernel.org
References: <20240607101847.23037-1-hdegoede@redhat.com>
 <6ebdcaca-c95a-48bc-b1ca-51cc1d7a86a5@lunn.ch>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <6ebdcaca-c95a-48bc-b1ca-51cc1d7a86a5@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 6/7/24 2:03 PM, Andrew Lunn wrote:
> On Fri, Jun 07, 2024 at 12:18:47PM +0200, Hans de Goede wrote:
>> Commit 66601a29bb23 ("leds: class: If no default trigger is given, make
>> hw_control trigger the default trigger") causes ledtrig-netdev to get
>> set as default trigger on various network LEDs.
>>
>> This causes users to hit a pre-existing AB-BA deadlock issue in
>> ledtrig-netdev between the LED-trigger locks and the rtnl mutex,
>> resulting in hung tasks in kernels >= 6.9.
>>
>> Solving the deadlock is non trivial, so for now revert the change to
>> set the hw_control trigger as default trigger, so that ledtrig-netdev
>> no longer gets activated automatically for various network LEDs.
>>
>> The netdev trigger is not needed because the network LEDs are usually under
>> hw-control and the netdev trigger tries to leave things that way so setting
>> it as the active trigger for the LED class device is a no-op.
>>
>> Fixes: 66601a29bb23 ("leds: class: If no default trigger is given, make hw_control trigger the default trigger")
>> Reported-by: Genes Lists <lists@sapience.com>
>> Closes: https://lore.kernel.org/all/9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.com/
>> Reported-by: "Johannes Wüller" <johanneswueller@gmail.com>
>> Closes: https://lore.kernel.org/lkml/e441605c-eaf2-4c2d-872b-d8e541f4cf60@gmail.com/
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> I'm not sure i agree with the Closes: All this does is make it less
> likely to deadlock. The deadlock is still there.

I agree that the deadlock which is the root-cause is still there. But
with this revert ledtrig-netdev will no longer get activated by default.

So now the only way to actually get the code-paths which may deadlock
to run is by the user or some script explicitly activating the netdev
trigger by writing "netdev" to the trigger sysfs file for a LED classdev.
So most users will now no longer hit this, including the reporters of
these bugs.

The auto-activating of the netdev trigger is what is causing these
reports when users are running kernels >= 6.9 .

> But:
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Thank you.

Regards,

Hans



