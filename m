Return-Path: <linux-leds+bounces-6507-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B2357CEA2F4
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 17:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A012B3022F1D
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 16:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD391319852;
	Tue, 30 Dec 2025 16:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ji9qwTpO"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D234723D291
	for <linux-leds@vger.kernel.org>; Tue, 30 Dec 2025 16:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767112558; cv=none; b=pIqLy+RRrkFqJlAOzfwlthI0gHh3DTdXYt/avekzwThAVAYKf5GxL8rXhVU6yXtIncoCiHjWUTDFkWPjXjvsjv8CGv1Xm/SSBXLYubAU7wgZUwO3zvv1xrthLX3mFeyORoqpbOgNXTwtAzE/IibYzN+hrebnJRMsB3UCRLPxj/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767112558; c=relaxed/simple;
	bh=1wQ/WIqwcgmKRkbPIx0yDFY45a7cXR6s67FQ4b9/Kvk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ktSqd2C21yKdlxeWdgaz4urElI8TEStRRhnpPehHc/oeJesKx9yWgELwfn2O1ImSoz1+eki2pq4p9rsos6NIjytGeCmry/8XUfPO/U7WFx8isSa7rw7dJkR3qqGv6EiMZaN5wiAPPudZqBJgfsr8JDO+311yXk6/PuQIu70zEfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ji9qwTpO; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5959d9a8eceso11440026e87.3
        for <linux-leds@vger.kernel.org>; Tue, 30 Dec 2025 08:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767112555; x=1767717355; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lPKpQJlCeJhCd8J/11ap+widQ29YewZ9v5ztqzPCYik=;
        b=ji9qwTpOjIVYeay2OnuRJFztTd+3iTPQpQr1svfFvaui1p7LQgzUDlJLyMEu290qQ5
         bdAltO/d/iKFbPTSsbdCkz0hCABih0TUNHaUbVYehSsi9nELPEQxZLYKlI7q5mcSPHDn
         Oe8gbe9shZbr/I3xZiXzbdNy8zKkjsRtfV4Pk1Xep/Eh4hlwLsbNbzCJW94K3tXCEIEw
         BQ0ApemdkxCX0ZMtSXGvWrVcZUiWenKpB38jOs5ACCFqiaPURWRrMtTEReuFlINmqcMk
         jcwgSHRs6uAe28y7NeWDrF9h5mBGnr2cjt2dqxtJpMeJfmsKfXU6C4TVxscLpRVNRfdR
         gHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767112555; x=1767717355;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lPKpQJlCeJhCd8J/11ap+widQ29YewZ9v5ztqzPCYik=;
        b=F/2YkuXqY5I/kbBUwjSGxLrjgz2XItokvB3JdLOo3yJ9O8Lg/rcymCJkvozpaxtvRy
         gpEhnp9gInXBqZ/p6vQ8NBOsfTDjUzwiZz8q1WncZbKyhQycXMqfj183jmywE8wfZGz9
         A9hidc+oV70Nn013Iqpd3Hxh7j9BSj9AnpfDjVAxg0Wa72k5roCring7XUukjGPNw7cL
         TTRRDb/V58N+Ul8T0eG59VEEmpvVJFRWjLwichgS5TKAe4hAZp9wdZ3g9en1GJwvgAEt
         nTnrmy2cxU4LyzkODXCgvRmkEkqE1nPJ/66KU9T9xStZ8Ud6hkfUUsb4AmRFP7zXl0el
         oYyw==
X-Forwarded-Encrypted: i=1; AJvYcCXakJ6teHM1isEwW2ihUwRNjqO+tNdBL1IICMLu8tRrc+gDM+hi1aYQFn/21UJp+QOA/Qo6MW8TbrKe@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgy9hynvsHDp6z/mrwj4roF8HgEnW/ge5Iu8m3lTFjbVuJbojH
	fadkAAoo5Wnqvoy7ez1QwWjNfC/QVy3NT2yhNRdY7GmwChg5iSrxu5cy
X-Gm-Gg: AY/fxX4RT4L1MqdWFzv+0Tkvh1RN8yb+FALmqwA+k9u0dSeNZl195hWk60h+gUBzAbN
	aVXa7ezGj6ijLaz4Ebt8qmxsfguEYAMkUzCQCOCQ7zgkl5wSDM525GkkyLqVc3oKQ2yfV4IyUgQ
	rPNibtEPS57eIvVr0G27p18F7SfeiByCApKPDbpY+7nn8QQhomX/p0U0KdV1r90diIi568kwODD
	Hb8PGDBpX8+okrQeaAsdm+KrzZnlUbdVVVndcwf7CgQPrDtd4RV8xswu2sfD2qtCs2WupBh57Ov
	TTs1yVwm/EYRR0ImeEJM+fJs0gBnSvkeNBV/DqEx5gHf3IMIhXtxbqSxyfaNVIKZVBMzkkTSf2z
	WjcwRoqw7WDwlnZvOIXqi0e0W8dZUfD8B0vvWP/mSdDaKSxJRXVYphplIIpYP96pj5Kl9BGYerO
	XergUcREb2IOT3FiKegiC3UwTdwYMA9xQu+A==
X-Google-Smtp-Source: AGHT+IEh3MZf6CTJOzZeHGCYU9GIDpW05Uh+YS/H0es49h+fagK6eB66vYua5uI+HyG3ZwOGSMS1kg==
X-Received: by 2002:a05:6512:b05:b0:59a:10c1:8f11 with SMTP id 2adb3069b0e04-59a17de704emr12001326e87.39.1767112554670;
        Tue, 30 Dec 2025 08:35:54 -0800 (PST)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5e32sm10121302e87.8.2025.12.30.08.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 08:35:54 -0800 (PST)
Message-ID: <8022bcc7-c47d-44f8-b5b0-d2ff74ad9efd@gmail.com>
Date: Tue, 30 Dec 2025 17:35:52 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [RFC PATCH 0/2] leds: Add optional instance identifier for
 deterministic naming
To: Jonathan Brophy <Professor_jonny@hotmail.com>,
 Andriy Shevencho <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Brophy <professorjonny98@gmail.com>, lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Radoslav Tsvetkov <rtsvetkov@gradotech.eu>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
References: <20251228182252.1550173-1-professorjonny98@gmail.com>
 <761d6573-3751-47fb-9b0e-8063f3cecf76@gmail.com>
 <aVJ0c3injbP7yRIJ@smile.fi.intel.com>
 <44ffa209-48b8-439e-a1ce-f9eb2aeb2f26@gmail.com>
 <DS0PR84MB3746F2BB2CB8381BA02013059FBFA@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>
Content-Language: en-US
In-Reply-To: <DS0PR84MB3746F2BB2CB8381BA02013059FBFA@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/30/25 00:59, Jonathan Brophy wrote:
> 
>>> The problem as I understood not exactly in this. The reporter wants
>>> deterministic way of the mapping between HW numbered LEDs and their respective
>>> names. It seems it was already mentioned that current code depends on the
>>> arbitrary probe ordering. Saying this, I now think that perhaps GPIO led driver
>>> should somehow allocate a range of the LEDs and then enumerate them in
> 
>> accordance with the DT description?
> 
> 
>> function-enumerator DT property enables deterministic enumeration.
> 
> 
>> --
>> Best regards,
>> Jacek Anaszewski
> 
> That's not really the the problem I'm trying to solve but it is part of it.
> The functions are quite ambiguous at the moment.
> Having a string that  can define something custom, the fallback _1 _2 identifiers are
> high lighting the issue because the lack of options.
> 
> I have a virtual led grouping driver that this restriction will highlight the issue even more.
> with a status led on a typical oem device that indicate multiple states eg:
> 
>   - Solid Blue: setting up/ committing settings change.
>   - Pulse Blue: factory reset/ first boot ready for setup or WPS in progress.
>   - Fade in-out Blue: system upgrade in progress
>   - Solid Yellow: starting up.*/
>   - pulse Yellow: resetting/ rebooting.*/
> 
>  From sysfs i will end up with the below that really does not explain the use:
> 
> led:status:blue
> led:status:blue_1
> led:ststus:blue_2
> led:status:yellow
> led:status:yellow_1
> 
> The LED subsystem has a semantic ambiguity:
> What does LED_FUNCTION_LAN actually mean?
> LAN port exists?
> LAN cable connected?
> LAN link active?
> LAN traffic activity?
> LAN speed indicator?
> 
> Rather than making custom identifiers that are overly specific we could make
> them up from stacking qualifiers or include a custom string to add meaning.
> Would this be preferable over filling the common.h with long time gone
> devices past identifiers that are overly specific to that platform or device? we
> already have a few of them now.
> 
> Something like this:
> 
> led-lan-link {
>      function = LED_FUNCTION_LAN;
>      function-qualifier = "link-speed";  // NEW PROPERTY
>      color = <LED_COLOR_ID_GREEN>;
>      led-instance = "port5";
>      /* Result: green:lan-link-speed:port5 */
> };
> 
> led-cellular-signal {
>      function = LED_FUNCTION_WLAN;  // or new LED_FUNCTION_CELLULAR
>      function-qualifier = "signal-strength";
>      color = <LED_COLOR_ID_GREEN>;
>      led-instance = "modem0";
>      /* Result: green:wlan-signal-strength:modem0 */
> };

LED naming standardization was introduced to avoid multiplication of
custom LED names for the same functionality. Allowing to define parts
of LED function in plain text would bring back that old problem.

Both function-qualifier and led-instance are not telling anything at
first glance. Their purpose would be to define meaningful LED function
name, thus we should rather think of introducing more advanced mechanism
for composing LED function name, instead of extending the LED naming
pattern.

That could be preprocessor macros that would concatenate standard LED
function name segments that would be still defined in common.h, which
would allow to keep the standardization.

Below example shows how some of your exemplary LED names could be
created with that (for numerical postfixes function-enumerator would
have to employed in addition to those):

// These ones already exist in common.h
#define LED_FUNCTION_WLAN "wlan"
#define LED_FUNCTION_LAN "lan"
#define LED_FUNCTION_INDICATOR "indicator"

#define LED_FUNCTION_PORT "port"
#define LED_FUNCTION_CABLE "cable"
#define LED_FUNCTION_CONNECTED "connected"
#define LED_FUNCTION_CABLE "cable"
#define LED_FUNCTION_LINK "link"
#define LED_FUNCTION_TRAFFIC "traffic"
#define LED_FUNCTION_SPEED "speed"
#define LED_FUNCTION_SIGNAL "signal"
#define LED_FUNCTION_STRENGTH "strength"
#define LED_FUNCTION_MODEM "modem"

#define MAKE_LED_FUNCTION2(seg1, seg2) seg1"-"seg2
#define MAKE_LED_FUNCTION3(seg1, seg2, seg3) seg1"-"seg2"-"seg3
#define MAKE_LED_FUNCTION4(seg1, seg2, seg3, seg4) seg1"-"seg2"-"seg3"-"seg4

Then, when called as below:

MAKE_LED_FUNCTION3(LED_FUNCTION_LAN, LED_FUNCTION_CABLE, 
LED_FUNCTION_CONNECTED)
MAKE_LED_FUNCTION3(LED_FUNCTION_WLAN, LED_FUNCTION_SPEED, 
LED_FUNCTION_INDICATOR)
MAKE_LED_FUNCTION4(LED_FUNCTION_WLAN, LED_FUNCTION_SIGNAL, 
LED_FUNCTION_STRENGTH, LED_FUNCTION_MODEM)
MAKE_LED_FUNCTION4(LED_FUNCTION_LAN, LED_FUNCTION_LINK, 
LED_FUNCTION_SPEED, LED_FUNCTION_PORT)

would produce below:

lan-cable-connected
wlan-speed-indicator
wlan-signal-strength-modem
lan-link-speed-port



> // Network qualifiers
> "link"         // Cable connected
> "activity"     // Data transfer
> "speed"        // Link speed indication
> "duplex"       // Full/half duplex
> "mesh"         // Mesh node
> 
> // Cellular qualifiers
> "signal"       // Signal strength
> "activity"     // Data activity
> "registered"   // Registered to network
> "roaming"      // Roaming status
> 
> // Power qualifiers
> "charging"     // Battery charging
> "low"          // Low battery warning
> "present"      // Power source present
> 
> I'm just really trying to find a way to make the naming more descriptive and I'm
> open to suggestions.
> 
> regards Jonathan Brophy
> 
> 

-- 
Best regards,
Jacek Anaszewski


