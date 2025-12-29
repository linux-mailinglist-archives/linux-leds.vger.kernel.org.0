Return-Path: <linux-leds+bounces-6480-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E472CE70F0
	for <lists+linux-leds@lfdr.de>; Mon, 29 Dec 2025 15:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07B8F3044C06
	for <lists+linux-leds@lfdr.de>; Mon, 29 Dec 2025 14:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99AB731984D;
	Mon, 29 Dec 2025 14:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mV+aDasU"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFD9324B0F
	for <linux-leds@vger.kernel.org>; Mon, 29 Dec 2025 14:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767018510; cv=none; b=ln/5W8EQArAoumFe+gXwgs3MMn/b/jKf2syuL20Ee+ftTPHv5y4TqZc5COi2vvli/xwcS2JhDvWUKJQKvR0B2LLCJERu5E2+8qPTiesFTEG1MqjR/ZNFNwx9QfFwmmV3tCJC+Odvb3GJ619zUUwGARnlpG4JVP/nhmnWq70AfJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767018510; c=relaxed/simple;
	bh=p19C5fUiaHYuyT8B3f5YKcSGz2HF8sHhEPGkk3Lr+ZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PIyIkBDx2o5jMkHWTTxfnwTksyUy/y5UqBKMSEm93MtsWyKMWRRRJwolYuOHWGQ2JUvDfTXlKlm0OO7kQesJiaLNgj3jmo3LYjU2eWcKLl9iIejhD+FTae4ydkpQI0r4gx+BRHgJNmVURF37hho4SZcG0r8FaTusX81BiKoH3BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mV+aDasU; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37a415a22ecso47257701fa.0
        for <linux-leds@vger.kernel.org>; Mon, 29 Dec 2025 06:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767018503; x=1767623303; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JlPQpMhsU9ZTNBtgWJtMFJBp0vgrJMleMmiswLOaeG8=;
        b=mV+aDasUePlqGzyAjJH2QGfpE7xQZxwKq63Ajd8/P3ZGtNuInrsvqx8kVcQE5PcKks
         woRXJTqhfLofmXIEK+cGXChI2pdpvtU8QUmCR7sq2A+MktntkX1rvxI1GuvUtcdNC1zc
         +4ILBAMkZcVD+dBUQWBFAuZs0Qo3OYrR7LhwUHziMZcfEvwkGuqa1rJumjsDueh4rOZA
         fTVfTEc7WimA35mkBq8AzuxNS/zKzcPukJun15oNp3SLGpfJNmo/YeMnz+S2iqa37DxM
         5i2k5R8ITPqH2T4Veo6rrEP+PXI2JXJgaQZcbp3wcJo9FSswOLizUG0CATPlktxxcrWu
         47Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767018503; x=1767623303;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlPQpMhsU9ZTNBtgWJtMFJBp0vgrJMleMmiswLOaeG8=;
        b=whFKQbPBGUKb/8+i2QfkdUDJ4D9AvIeVKnM0P+FfN+3a9Ve3VfJwF97K9Ia1+7EK7u
         gz+Yz69WM3vOWz/L04rm/UzlbUeWQ9qrSYWO6Q+v7FfWw2zAn8PGGQGm0/3JYhigchew
         XQ7/Q75LeGyDcOYRERgm0veOjywyBXDRibyGEq69GFh61P5h3nFjU4h+F+GOwyTFvrH0
         /gmPj0TF3Vc/wX/eCI7oOyX2TQfXNNbbqVCy/jG9lXMI0G5F3HlMkq3nE2M/kSWxo188
         wz7koTkA0b5veqjN/ySFU/NuFMUrnXDn0KVad0UTalqeiI0byScAyn2q/nN/2l+aMGt1
         KDIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE83MlNlZ6ugrZT5FJ9iDYAa+EAZXhQsPNiwQZjcW7cABsUrGocn6U79miBhpDECoBFOuOLDi2N6gN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1md3Hl4Y88+cNzrrJjXlDsOq8UK01uONgTqraQvqW2fIa7C1t
	8+ZlwBgotYlH4uiD8WZEPU8KoxQyREDVgbjhtTDQxt360pL7rkZ4Ztrs
X-Gm-Gg: AY/fxX4RtjrEb0dNe8HIeSQWfzVvlXlpL9NTpt2GFqQ6xpfGwv8R0nF96+O1h6z/KHk
	TqyCnXelANEz5CWcEfIyS+UIkJS4FUJuBrEnJJoDowCPZypWzIR+D1vMMA823HeSUYSrzyuxTup
	B7AzDMhgvsnlA5obfQ5Ia8Ul1zCtGtubIJ7FXML+KlzyYCj/x/g056viWA3Pf4ZjGS0fhZy0zai
	/UfSRvEXqh4KqDQncQuqO4ytWtO3lpQobu9uB/B44s4/WdzNX0k5+5eDj0dDXFinZE+Ruc6MRC1
	1fDoBd160bYrQuCHthIXbeCVGn++OLkWEDpCQMJvEF1mJtat6hJPHixvUeonHiecwdHRzVVqsLw
	FeG8uXV/Z0wp6jWXg0kzurdC2WS37Kdr+CDUIYfEmxhfwdTM77dhpbgy13p+Sr3AmRqzA89g2Ys
	SDvxPBl8Uavq4dQRDAXnv0EyzVRwsQ6EvQHA==
X-Google-Smtp-Source: AGHT+IHzJs2Slc9So9wW48MzyPul6GDqnIF6AT7GrqTVvPa+W/JUEnh3sVxZGeJbDeSkSP8ozT6dNA==
X-Received: by 2002:a05:651c:30ca:b0:382:624d:a770 with SMTP id 38308e7fff4ca-382624daa40mr38719581fa.15.1767018503034;
        Mon, 29 Dec 2025 06:28:23 -0800 (PST)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812264cc13sm83859981fa.37.2025.12.29.06.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 06:28:22 -0800 (PST)
Message-ID: <44ffa209-48b8-439e-a1ce-f9eb2aeb2f26@gmail.com>
Date: Mon, 29 Dec 2025 15:28:20 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] leds: Add optional instance identifier for
 deterministic naming
To: Andriy Shevencho <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Brophy <professorjonny98@gmail.com>, lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>,
 Jonathan Brophy <professor_jonny@hotmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Radoslav Tsvetkov <rtsvetkov@gradotech.eu>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
References: <20251228182252.1550173-1-professorjonny98@gmail.com>
 <761d6573-3751-47fb-9b0e-8063f3cecf76@gmail.com>
 <aVJ0c3injbP7yRIJ@smile.fi.intel.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <aVJ0c3injbP7yRIJ@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/29/25 13:30, Andriy Shevencho wrote:
> On Mon, Dec 29, 2025 at 12:16:17PM +0100, Jacek Anaszewski wrote:
>> On 12/28/25 19:22, Jonathan Brophy wrote:
> 
>>> This patch series introduces an optional "led-instance" device tree property
>>> to address non-deterministic LED naming when multiple LEDs share the same
>>> function and color.
>>>
>>> Currently, the LED core appends numerical suffixes (_1, _2, etc.) based on
>>> registration order when duplicate function:color combinations exist. This
>>> creates several problems:
>>>
>>> 1. **Non-deterministic naming**: Registration order determines suffix values,
>>>      which can change across boots due to probe ordering, async initialization,
>>>      or module load order.
>>>
>>> 2. **Non-semantic identifiers**: Names like "lan:green_23" provide no
>>>      indication of which physical LED or subsystem they represent.
>>>
>>> 3. **Breaks userspace automation**: Network management tools, LED control
>>>      daemons, and hardware monitoring cannot reliably identify LEDs.
>>>
>>> 4. **Ambiguous numbering**: "lan:green_23" could be mistaken for LAN port 23
>>>      when it may actually be the 23rd registered LED of any port.
>>>
>>> 5. **Namespace pollution**: The alternative of adding vendor-specific function
>>>      names (LED_FUNCTION_LAN_PORT0, LED_FUNCTION_LAN_PORT1...) pollutes the
>>>      function namespace. The instance identifier keeps standard functions clean
>>>      while allowing contextual differentiation.
>>>
>>> 6. **Breaks naming convention**: The _1, _2 suffix was intended only as a
>>>      collision avoidance workaround, but has become the de facto standard for
>>>      hardware with multiple identical LEDs.
>>>
>>> **Example: 48-port network switch**
>>>
>>> Current behavior (non-deterministic):
>>>     /sys/class/leds/lan:green      ← Port 0? Unknown
>>>     /sys/class/leds/lan:green_1    ← Could be any port
>>>     /sys/class/leds/lan:green_2    ← Could be any port
>>>     ...
>>>     /sys/class/leds/lan:green_47   ← Could be port 1 due to probe order
>>>
>>> Proposed behavior (deterministic):
>>>     /sys/class/leds/lan:green:port0   ← Always port 0
>>>     /sys/class/leds/lan:green:port1   ← Always port 1
>>>     /sys/class/leds/lan:green:port2   ← Always port 2
>>>     ...
>>>     /sys/class/leds/lan:green:port47  ← Always port 47
>>>
>>> **Example: Multi-domain power indicators**
>>>
>>> Current behavior (non-deterministic):
>>>     /sys/class/leds/power:red      ← Which power source?
>>>     /sys/class/leds/power:red_1    ← Which power source?
>>>     /sys/class/leds/power:red_2    ← Which power source?
>>>
>>> Proposed behavior (deterministic):
>>>     /sys/class/leds/power:red:mains    ← Mains power indicator
>>>     /sys/class/leds/power:red:battery  ← Battery power indicator
>>>     /sys/class/leds/power:red:usb      ← USB power indicator
>>>
>>> **Design principles:**
>>>
>>> - Backward compatible: Instance identifier is optional
>>> - Extends existing convention: function:color becomes function:color:instance
>>> - Follows kernel precedent: Similar to eth0/eth1, gpio0/gpio1 naming patterns
>>> - Ignored with deprecated "label" property: Avoids conflicts with legacy code
>>>
>>> **Alternative solutions considered:**
>>>
>>> 1. function-enumerator: Only supports numbers (0, 1, 2), producing names like
>>>      "lan:green-0" which are still non-semantic. The 48-port switch needs "port0"
>>>      to match physical port labels.
>>
>> I think that we have currently everything in place to address the issue
>> you're trying to solve with this patch. Just introduce dedicated
>> function like LAN_PORT, and exploit function-enumerator.
> 
> The problem as I understood not exactly in this. The reporter wants
> deterministic way of the mapping between HW numbered LEDs and their respective
> names. It seems it was already mentioned that current code depends on the
> arbitrary probe ordering. Saying this, I now think that perhaps GPIO led driver
> should somehow allocate a range of the LEDs and then enumerate them in
> accordance with the DT description?

function-enumerator DT property enables deterministic enumeration.

-- 
Best regards,
Jacek Anaszewski


