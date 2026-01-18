Return-Path: <linux-leds+bounces-6666-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EB1D39819
	for <lists+linux-leds@lfdr.de>; Sun, 18 Jan 2026 17:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 117603009839
	for <lists+linux-leds@lfdr.de>; Sun, 18 Jan 2026 16:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ABD522FE0E;
	Sun, 18 Jan 2026 16:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZmroWXG"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8200221F20
	for <linux-leds@vger.kernel.org>; Sun, 18 Jan 2026 16:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768754894; cv=none; b=ai/9rbX8pRqXQq6d3tYap7LTcXH+ikltk8W2ZvWLkRFhrsFmcMAcAwg3yYOHha13bSAbWG9JS9XrAjgkePkSPYlA+2XqFo2tUSYM0xx9V+gGlUw6j5ksGW7wHzwAFHCbASLEZDmYKTvgRKRrQlVDts21XWQxqLXHjqvOhfFKMPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768754894; c=relaxed/simple;
	bh=ObBNgYmI7km2QNXCjpehnGoXCANLUlsMEgFWywznUhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M8gPOBqoWOMyVgrjCuuQw3W6U7OOxRjy9d8XPjB+xOkthY38OHHZlNhdz1bySR/AL68H1jr3uVIME1VdfHsQgQlL+b7ETNoSPdP+ukUsDHUPqudUy6YqMYoONxVdVTnzmeNtSKGmVdOGh7FqDnEmZvsPfZ4lOeU34luRngr/47E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZmroWXG; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0fe77d141so23458025ad.1
        for <linux-leds@vger.kernel.org>; Sun, 18 Jan 2026 08:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768754893; x=1769359693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X0twtbtNGNQIp4HwkKCyjxkTPom6wsw2QrSPQrsy5co=;
        b=QZmroWXGE2ruM9WWPVMd5Mce81h1MzxLNb1GU2Y88ANcqBMiCbfAvudkzw5F6thdSA
         vTpwCuadlDcbqtWRwRws1YPx8LEChH0aSro75GGoOrdZGv6IgERwWpt327lE99aPAKnb
         VbEshIC/mA3s9Wih+XOrIitoKa8xUL19DBZhJFE06S6Av0lxu5Gr6NzXtc6l5UkcV4Fm
         YmenxwTZ09K1BfQktlGa4wcCibAv8oBNKOk1OxIhchOsN+bFQvQxXjVvcC2nyY5CJFVW
         rT61hvktJ6wuyGTNZRFff/1bdHhbtkT24b/1DV8ptMuqvhTt1KgD3jgIxM+J8cVIEEoB
         b1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768754893; x=1769359693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X0twtbtNGNQIp4HwkKCyjxkTPom6wsw2QrSPQrsy5co=;
        b=Bd4TO6zpzI6lGH8VO9TY0SzAIsYe3ovUDw2Q1j36z0HblWfjwDaDCIf8xdDPZy7N/S
         zL0YPCL06N3m7b1iFhvUwcCmavdzdHTPDw1jRpfg5GoqxMwymtbQVcv+1g824L5vlkBe
         xAlyLg1kMeQHgodf7ZnDnA1FICnoizgkLWdpWB6W+VK69Od7vR9LK9pFK/xJ3jBmnReN
         e8zDNCfh5lML2LCReuD8DxYEepMTjKItLo0TeTkrztM57INRVLA2mG3s6N+FRdfN1W85
         EZ0rPL4G8rqeF8fRqlHCsIniZDzXjYD0/YuCTAPr8Z+0uo5kJxjOWqXplM5vONVhendB
         QzKA==
X-Forwarded-Encrypted: i=1; AJvYcCW1Xuost4MJhPjPP2b8+PUeEXCUmVI4VjnEQMrLtBxBtk/reJSnBH43GDH0+8xbWNuPDQcmP7o6Zg/8@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ0XHKNkL9F9x/46lHzblA0/pD5nvq8bOIX6cA6hv8BYXG0jKj
	xp09OL27LBq80Et4x183FMf+BmJQBPDd/CY2eDz1dxKiwLzejDJSMK6h
X-Gm-Gg: AY/fxX7H/SaOBS1PDsfuzCYlNUbm3id2Y3Y+EmEDQSpc7tjdnhnnVPZlcH1qH766AzE
	YMF7O5E5efx5oS2CJL8cnDW4fQNY+03mY6oB9RRG8Ml6mQbtWaH22tkisY4IqtF8PxXxu2aT3G8
	iqMhW4jV1kcDxC/dWDieCNJ3g8R+TzVYC+gKNZ5RFg7iTv33k22i5x2PcE21esRXvnzR//u/eYu
	b87/PlP1QBf7L9G1mxHJTXPAG2Q0NrGWj1sUbj5mIqoAPctTQpN/q3+ZzM07iy4cQrNvU2U5jFv
	75lh/KXACuvWUH+0+uARcQKFpaOhPcoE6qK4FZNcJOP25Bb+YWvw7IMWQWjvDNXJ4ppYXnOBfHg
	KZy1tJjitEoc6nXBIzUyOITETFCyq8Zd22PmLFgvYp1yFfhhUt5R/dl9SlKScU0NypUAg4nSsSz
	LHRaCIv0mMMsDXEZ4TrsccfQ6Ip1Mup00dI5A=
X-Received: by 2002:a17:903:124d:b0:29e:76b8:41e5 with SMTP id d9443c01a7336-2a7175be718mr92063215ad.30.1768754892810;
        Sun, 18 Jan 2026 08:48:12 -0800 (PST)
Received: from [192.168.31.239] ([167.103.54.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dbbf5sm70904105ad.47.2026.01.18.08.48.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 08:48:12 -0800 (PST)
Message-ID: <95a49665-f379-48a7-a2b5-d288cdfdc0a8@gmail.com>
Date: Sun, 18 Jan 2026 22:18:32 +0530
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: backlight: gpio-backlight: allow
 multiple GPIOs
To: Daniel Thompson <daniel@riscstar.com>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260105085120.230862-1-tessolveupstream@gmail.com>
 <20260105085120.230862-2-tessolveupstream@gmail.com>
 <aVuKdAyXfWLs-WJI@aspen.lan> <c182df66-8503-49cf-8d1d-7da17214b843@gmail.com>
 <aWe7_hFpmO0E2sJe@aspen.lan>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <aWe7_hFpmO0E2sJe@aspen.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 14-01-2026 21:23, Daniel Thompson wrote:
> On Tue, Jan 13, 2026 at 10:15:53AM +0530, tessolveupstream@gmail.com wrote:
>>
>>
>> On 05-01-2026 15:25, Daniel Thompson wrote:
>>> On Mon, Jan 05, 2026 at 02:21:19PM +0530, Sudarshan Shetty wrote:
>>>> Update the gpio-backlight binding to support configurations that require
>>>> more than one GPIO for enabling/disabling the backlight.
>>>>
>>>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>>>> ---
>>>>  .../bindings/leds/backlight/gpio-backlight.yaml      | 12 +++++++++++-
>>>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
>>>> index 584030b6b0b9..1483ce4a3480 100644
>>>> --- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
>>>> +++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
>>>> @@ -17,7 +17,8 @@ properties:
>>>>
>>>>    gpios:
>>>>      description: The gpio that is used for enabling/disabling the backlight.
>>>> -    maxItems: 1
>>>> +    minItems: 1
>>>> +    maxItems: 2
>>>
>>> Why 2?
>>>
>>
>> In the current design, the LVDS panel has a single backlight that
>> is controlled by two GPIOs. Initially, It described as two separate
>> backlight devices using the same gpio-backlight driver, since the
>> existing driver supports only one GPIO per instance.
>>
>> So the maintainer suggested to extend the gpio-backlight driver
>> and bindings to support multiple GPIOs.
>> https://lore.kernel.org/all/q63bdon55app4gb2il5e7skyc6z2amcnaiqbqlhen7arkxphtb@3jejbelji2ti/
> 
> Right. So, once we support multiple GPIOs then why limit it to 2?
> 

Okay, got the point. I'm removing the maxItems constraint entirely 
to allow any number of GPIOs as below:

diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
index 1483ce4a3480..82698519daff 100644
--- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
@@ -16,9 +16,11 @@ properties:
     const: gpio-backlight

   gpios:
-    description: The gpio that is used for enabling/disabling the backlight.
+    description: |
+      The gpio that is used for enabling/disabling the backlight.
+      Multiple GPIOs can be specified for panels that require several
+      enable signals.
     minItems: 1
-    maxItems: 2

   default-on:
     description: enable the backlight at boot.

Does this approach work for you?
> 
> Daniel.


