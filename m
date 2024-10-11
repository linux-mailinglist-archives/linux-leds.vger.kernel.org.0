Return-Path: <linux-leds+bounces-3078-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E8B99A4ED
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2024 15:23:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C48D0B2472E
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2024 13:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E512185BA;
	Fri, 11 Oct 2024 13:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ed20bO6u"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B858E216454;
	Fri, 11 Oct 2024 13:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728652950; cv=none; b=jgws0tUbzJSQRgWjke/gJH+SROUOcybov2xNkJXKnhLBBNcG1jC9MxcWLyAqrDmtr84Urb/aYcnyxpxalagc/cg6ugDm2SULiLslzr5diYgi2tFnSKhLzrXc82XqTzD2Ab0IITtYv5JOVDxXAXIVuGC50I5r0zYOxIl2Twv5oaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728652950; c=relaxed/simple;
	bh=X4jrEL73piYv2hQshoFHqqebq4fF76gXm6+LMN6Al/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E5f19QXlVADJ4Xv01IX5piFLIJjGg1puWiBf2cy1KJ5lIju3gZU/paQCCoKULAtRyZoyxy53DeJcKhj/0nNP/EGTxHBtMQoliky8pXivtOlv23Mqt5bBtAXtJk6n4exCZ2QPn0K0qRhIAY0uooYa4sc1hblAESXpmq/6ro81p/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ed20bO6u; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20cb89a4e4cso217375ad.3;
        Fri, 11 Oct 2024 06:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728652946; x=1729257746; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TvLMHXo3BfNUkLw9ytw5UuEB+h5y/vEG9NYRyEiEEL4=;
        b=ed20bO6u5NnEPTuWFwJ3N5fO6T7IomRTku4Yn72cjasxlm/c21UQgeYc2XIZ/o+GwA
         Q7vQVC6LG2ZFzeJX/lTEdc4SWSJIY0MGu/d9v2YG/JV19yCYD1baLQs7xLoxbTRu2pKV
         YmxTax0pJV8jHcW01tCe1Vn7FP0giB4oY37ZRiG7eTB3JfuQ1DjFLxLE1TCY/42A9ns4
         850ppKJOzSM2v4sotL1m1LP6Ygk8V+ksHEhm8DuK8Z4DsE4GoMqkbqy1hnlL4RDe1G9H
         zxt+tgJHx5mYdm7cu1jphVRITl/4jVaXgqv0xFUeJpJMYAA/StrW6w8N+6rM2sBsdvhk
         Bsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728652946; x=1729257746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TvLMHXo3BfNUkLw9ytw5UuEB+h5y/vEG9NYRyEiEEL4=;
        b=TZpI4zXP4PrmSx5TMIPu00rjnvt7soEpoG1hJ1IhX/jLj6Ne9cS27E7sNgWeWqbRt6
         xnWCctC2fXdtcS2PRCvMLYlgTaIbuqXEFAVbab6Hitfng/XYxBJPsrOCmhPbTaExGHTL
         d92Zi4P20dSQmiEZ/VoaE6mIE7O5+PWhdRrz3Lmp0oTWLFx5FToFb9IGS7eDdIQOl5nT
         jI4Tw8ygY9lvta3Dte5dZCcD6zys7LRJ+vF4EI4MzNn96c9SUAUaTsJYr8KkRhUdhOqO
         IGbP8Da1DW1rTqIU7KMJ8S0WGhTuGQb3zG5UbDUYSLnCw29+zE7kj/GKF+TBcfb+Lr60
         Z8Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVL6PHxwi2dY//xeMSydGUGZZgPGXDCZUaR7Vs5AHMjROhm2CPWZXUlrX5HImFQgZkZK0cSmIfQlBeveWQ=@vger.kernel.org, AJvYcCXkHCDE3vQFz01Ca7np9WPAcGvNlIvT2aWsVcLQD1yyTDAOh7skdYkshQIIoA4p9yB46EZQUYvLLmIsSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3OdMiCUgX+VKgBDzuwvzNd0O0wjdEooiraKhEev9b/MkYMbX0
	kQHI6Xif6HJd/jdnwzkvTc6vzkc/Lnwoc9Pqa2oK6OxNqw8lfv84
X-Google-Smtp-Source: AGHT+IHVe8IOBQZmu+MX/aAlR434no8yh5BEm3aOGISvPCP+fwJlanDcT/2aukoQplmi0ob1+Zo46g==
X-Received: by 2002:a17:902:ce89:b0:20c:8fd4:eda0 with SMTP id d9443c01a7336-20ca147b16fmr36891675ad.24.1728652945767;
        Fri, 11 Oct 2024 06:22:25 -0700 (PDT)
Received: from ?IPV6:2409:40c0:11a4:8d8a:687:fb0b:3c04:c809? ([2409:40c0:11a4:8d8a:687:fb0b:3c04:c809])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c348986sm23257035ad.258.2024.10.11.06.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 06:22:25 -0700 (PDT)
Message-ID: <7274be28-aefe-49b1-b8e1-dd1c2bad96d0@gmail.com>
Date: Fri, 11 Oct 2024 18:52:18 +0530
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH] leds: Fix uninitialized variable 'ret' in
 mt6370_mc_pattern_clear
To: Lee Jones <lee@kernel.org>, pavel@ucw.cz
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241006131337.48442-1-surajsonawane0215@gmail.com>
 <172863776565.3130628.18378710932238203204.b4-ty@kernel.org>
Content-Language: en-US
From: Suraj Sonawane <surajsonawane0215@gmail.com>
In-Reply-To: <172863776565.3130628.18378710932238203204.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/10/24 14:39, Lee Jones wrote:
> On Sun, 06 Oct 2024 18:43:37 +0530, SurajSonawane2415 wrote:
>> Fix the uninitialized symbol 'ret' in the function mt6370_mc_pattern_clear
>> to resolve the following warning:
>> drivers/leds/rgb/leds-mt6370-rgb.c:604 mt6370_mc_pattern_clear()
>> error: uninitialized symbol 'ret'.
>> Initialize 'ret' to 0 to prevent undefined behavior from uninitialized
>> access.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] leds: Fix uninitialized variable 'ret' in mt6370_mc_pattern_clear
>        commit: b5a5659aebfffbcddb81abafe042fb4044b6ff9e
> 
> --
> Lee Jones [李琼斯]
> 
Thank you! I'm glad the patch was applied. I'll ensure future patches 
follow the necessary guidelines.

Best regards,
Suraj Sonawane

