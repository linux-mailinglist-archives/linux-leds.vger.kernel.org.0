Return-Path: <linux-leds+bounces-2433-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AE494ED52
	for <lists+linux-leds@lfdr.de>; Mon, 12 Aug 2024 14:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F31E1F22979
	for <lists+linux-leds@lfdr.de>; Mon, 12 Aug 2024 12:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B611F17BB08;
	Mon, 12 Aug 2024 12:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f2gCqHYM"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B30717B511
	for <linux-leds@vger.kernel.org>; Mon, 12 Aug 2024 12:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723466908; cv=none; b=Cv91/k5P2aPxauTeROROF4Uz6GQyPblBZW4ApSHs3+5ILqeMql+PAnWNlcNsBNlbrUDv1Bjl0RMpOMpPgS0ttpbVqK0WhdcvCMYqb80awVgiEVnUWEy0BiREnnhIS0999xvfbO6Tie8zLWnV8pGGrs1kmR2ILpruNjXakGDYxVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723466908; c=relaxed/simple;
	bh=8bo8xpp/6vJwbHGAAvw+1pSQFYWA+0dCEVeKlYLVTqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oTrcPpiqWfUTJaCuGefkOc+xKkL5deXsSfuyzHpgtiSi5UfA/CWV+gnVQevek0ook+zBA7qZQueNz5F8w95AvmTiBIvPg8gdU2hJkNBcQxeBXrRdZCHSUZobnwnLKU4WA/W6RQiXNDq32WIuOhmn+TunN1N7PUrNoRHSE3f3+1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f2gCqHYM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723466905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8d8haasheAsFVThGjhEYRKDinSaCWYMQj8ax5D0rh3A=;
	b=f2gCqHYMBzEC8mKBzP4+7bZXi/O3UGirs0jKhdem0TE7Zn/CdYqUj2+VJgIBKJN51/0pV8
	gSSgzn3+tYX+4q/j/SlS+l6yhc0FZ4LDx+1by1dkYd7yHRoRoA04fQ2A/SNEdHQEQns1ZZ
	BySuLPmikBeRI7gLT4rYx1GqnGvFZaY=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-RCl_LGxxPiCFUIP5eQgVNg-1; Mon, 12 Aug 2024 08:48:22 -0400
X-MC-Unique: RCl_LGxxPiCFUIP5eQgVNg-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-52efce218feso5375600e87.1
        for <linux-leds@vger.kernel.org>; Mon, 12 Aug 2024 05:48:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723466901; x=1724071701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8d8haasheAsFVThGjhEYRKDinSaCWYMQj8ax5D0rh3A=;
        b=PhP9QqRIxoTShSIikvmfHb1nD15mgnJ23uFSBe73GpyAISH5wegTpEjH6SxPCA9wNQ
         LaArq8BK44BPEujFqInBtwpld1xZFMqtuj6zdEhakPbaI1l9BaGloezKZIj5lzb7yR2l
         wF4aE4uB98Vj3GU8YwDO3PpmzPwZXT1pBQz5Ez0Efk/JQJI/rWeLaulGTSPplvlu9ec5
         7ebDJn44eo/qjZilqTSJpXdr4PbsxFgOgT34MX3r80pj0yoiVsEQqja0fvcrPkfi5z4L
         lS/EsegZs24UX3TweiAgJnKDPpRWbERXE4BPvloUh16U4PtBN7K4G65R02N6ZJ+skQ93
         NMuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeEgRU58V80mhwR6TuYL5neGjqgg4UU/fOW1C/PqMMwFAYU1a7nfNDAaup4tCOQ8P+Xk3lXzh/xuvAcDL+v5t2FGYhdde2CjBKYg==
X-Gm-Message-State: AOJu0Yxv5Nxs59HzMRZHqopa/1ej541QZPvsi8g3iSxMBQ9cFPEvIjVG
	18RAOQO4puwsKnYTTTymsz8EsYF4N1z3zjTKpoUPl3Fzbv6ETV27QP3IJIIYKSdkypsB32ByBBY
	TxmNd6G/oItIb/90CXnOG15/goW45rCBJkztpIG3UaP2eEog19yXSZTmYRxY=
X-Received: by 2002:a05:6512:3e0c:b0:52c:e07d:229c with SMTP id 2adb3069b0e04-5321365d338mr7198e87.22.1723466900841;
        Mon, 12 Aug 2024 05:48:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHejkkgyA0azZvDT/mX1/XOZpJaecJH2R29rXxfhob07pjKW9TXVcI9hlTBx8S42862SP10xQ==
X-Received: by 2002:a05:6512:3e0c:b0:52c:e07d:229c with SMTP id 2adb3069b0e04-5321365d338mr7163e87.22.1723466899980;
        Mon, 12 Aug 2024 05:48:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb243c3dsm229614366b.225.2024.08.12.05.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 05:48:19 -0700 (PDT)
Message-ID: <7bf12e39-8956-4cd3-a90a-871291d84370@redhat.com>
Date: Mon, 12 Aug 2024 14:48:18 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] HP: wmi: Add documentation for the LED API naming
 scheme
To: Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>,
 ilpo.jarvinen@linux.intel.com, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>
Cc: mustafa.eskieksi@gmail.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Linux LED Subsystem <linux-leds@vger.kernel.org>
References: <20240719100011.16656-1-carlosmiguelferreira.2003@gmail.com>
 <20240719100011.16656-3-carlosmiguelferreira.2003@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240719100011.16656-3-carlosmiguelferreira.2003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

+Cc Pavel, Lee, linux-leds for review by the linux LED subsystem folks.

Pavel, Lee there are 2 pdx86 drivers for control of zoned (3/4 zones)
RGB backlit laptop keyboards pending:

https://lore.kernel.org/platform-driver-x86/20240719100011.16656-2-carlosmiguelferreira.2003@gmail.com/
https://lore.kernel.org/platform-driver-x86/20240806205001.191551-2-mustafa.eskieksi@gmail.com/

both of these will use 1 multicolor LED class device per keyboard zone,
using the naming convention documented in this patch.

It would be good if we can get feedback or an ack from you for this
userspace API before merging these drivers.

Note the first part of the patch documents the already existing naming
scheme for single zone (RGB or mono color) backlight keyboards. This
scheme is already used by many drivers and by userspace consumers like
upower. So this is just documenting existing userspace API which so far
was not documented.


Carlos, Thank you for writing this patch.

For v2 please change the patch subject to:

"Documentation: leds: leds-class: Add documentation for keyboard backlight LED device names"

and this should also be merged through the LED subsystem tree, so for v2
please send this to Pavel + Lee with linux-leds + platform-driver-x86
in the Cc.


On 7/19/24 11:59 AM, Carlos Ferreira wrote:
> This patch adds documentation for the LED API class-device naming
> scheme practice.
>
> Signed-off-by: Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>
> ---
>  Documentation/leds/leds-class.rst | 40 +++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/Documentation/leds/leds-class.rst b/Documentation/leds/leds-class.rst
> index 5db620ed27aa..8e74a436ca9b 100644
> --- a/Documentation/leds/leds-class.rst
> +++ b/Documentation/leds/leds-class.rst
> @@ -116,6 +116,46 @@ above leaves scope for further attributes should they be needed. If sections
>  of the name don't apply, just leave that section blank.
>  
>  
> +Keyboard backlight control
> +==========================
> +
> +For backlit keyboards with a single brightness / color settings a
> +single (multicolor) LED device should be used to allow userspace
> +to change the backlight brightness (and if possible the color).
> +This LED device must have a name ending in ':kbd_backlight'.
> +
> +For RGB backlit keyboards with multiple control zones, one multicolor
> +LED device should be used per zone. These LED devices' name
> +must follow the following form:
> +
> +	"<devicename>:rgb:kbd_zoned_backlight-<zone_name>"
> +
> +and <devicename> must be the same for all zones of the same keyboard.
> +
> +Where possible <zone_name> should be a value already used by other
> +zoned keyboards with a similar or identical zone layout, e.g.:
> +
> +<devicename>:rgb:kbd_zoned_backlight-right
> +<devicename>:rgb:kbd_zoned_backlight-middle
> +<devicename>:rgb:kbd_zoned_backlight-left
> +<devicename>:rgb:kbd_zoned_backlight-corners

The -corners zone was based on a misunderstanding about
the Excaliber laptop's functionality, please drop
the "<devicename>:rgb:kbd_zoned_backlight-corners"
line here as well as below.

Regards,

Hans



> +<devicename>:rgb:kbd_zoned_backlight-wasd
> +
> +or:
> +
> +<devicename>:rgb:kbd_zoned_backlight-main
> +<devicename>:rgb:kbd_zoned_backlight-cursor
> +<devicename>:rgb:kbd_zoned_backlight-numpad
> +<devicename>:rgb:kbd_zoned_backlight-corners
> +<devicename>:rgb:kbd_zoned_backlight-wasd
> +
> +Note that this is intended for keyboards with a limited number of zones,
> +keyboards with per key addressable backlighting must not use LED
> +class devices since the sysfs API is not suitable for rapidly change
> +multiple LEDs in one "commit" as is necessary to do animations /
> +special effects on such keyboards.
> +
> +
>  Brightness setting API
>  ======================
>  


