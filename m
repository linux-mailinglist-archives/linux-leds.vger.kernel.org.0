Return-Path: <linux-leds+bounces-3107-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9769A0030
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2024 06:28:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E8601C2490F
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2024 04:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C996C187350;
	Wed, 16 Oct 2024 04:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JqzSOuOm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553CB21E3BF;
	Wed, 16 Oct 2024 04:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729052748; cv=none; b=HVQ/cZVMplM6HE8k+bvLADOuIawlLMk0/KmKrZccHq2//vqrNMctOYEvoGoNoTrr20U9ck6zNMiusnYB2p5WrNrCiF7uYwpyZMH04eg0a3PIKd4dh/x6ps1iXBh7doUOZLwIHj0Ldyv/H52W8ESHay4un8zMwCsfMt3Q4JAS1rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729052748; c=relaxed/simple;
	bh=oxAFJQbiQnzQGUda9QEXJFc+5bXiKV8Aixsv52j/zEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZTwNP7Vf4oLTb4lVuK2MYyg/SlaU5sbupJ2+XK0q/fQZsS1oQkDAcIfP8L89gxRvzbvs+66iHBYDdDnCOzQk4jte1oInEwEj4MjJxuRbus1kai2EpYSBHDvmAAoGlTClVPMfTWnIDfa2sY4ChLLzHnUhtShCDGmkITiG5pkzvm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JqzSOuOm; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71e4244fdc6so3135469b3a.0;
        Tue, 15 Oct 2024 21:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729052746; x=1729657546; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AuSywXYoElsxrjkfwv/M1S/AVxPVwxoJ4Eg9UCE0j2Y=;
        b=JqzSOuOmjZVse9732ekWLG6a6qH4UD6MyuneFfouL1XcqjVYvBq8CjgL06vxmciQBB
         fzBgaNdmNiFbAswvCFFEMqKMCHhhSIqHhIeKwI/BZKEUqRm1YbEBxdzFc0Vq7Yiv9bSC
         oTXQz6NUzya1BITvov2t+H5Ph0C6nyEBAjAnReS0l9fJmMLtLlyBTLtDWIN4hCB5mk3e
         HYZbm+tZ0rAM3AC21dQehLx7wEavBKy4vAubmilW2/l8+SdIk9KK5993rUb9zzdSeTDY
         1Q31XQSNc+ZXc+aShhwGFEdlTXaqYLt5YzZrGbam3x69smwIKDJHzfvNLFPiPiVUBZ+i
         Piyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729052746; x=1729657546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AuSywXYoElsxrjkfwv/M1S/AVxPVwxoJ4Eg9UCE0j2Y=;
        b=w4l2uWSYz+Dmz/qWTiAHZfM1qTBcZgHLdNROTYRrv7+CGEcgKlVcPtu+RRbN0rxuyk
         GQj9e+LwFzhIzzwybghfMtk5PbU68usll+5lXPFV9qoDu9pvZT7w/DZKnfgIFJOT0zAH
         VSfqN00CV9AzD6ETePAfDoc6s6//sM9AtlJ8MfnTQF4kov2MFvf27VNLr/wphaWp4W3G
         GYKaNgKro4uGBu5btHmb3mZpKCEgsrZKvt5lkADSpnmwqyXg1kD4g2wf4pisJvYtdENz
         ZVI5GXF/C3Y6uTzpbNE3UsNXVFeDopCUJ+ZWbxz9FSjwu3ASdTNiLcDTrRq7ucBvwFW3
         fKYw==
X-Forwarded-Encrypted: i=1; AJvYcCUItdIwrq/DMfYJkTzqXHHOc5bq2VrzbAu8Jeie4BERcA8wKOYXuaPf1KehRkegyALDjYYYClzH/ktepw==@vger.kernel.org, AJvYcCXmgnvEyMQsXzLcUbdMkanZ4QlmnZgEyabadEKYceoFYqvG1VfaeyQ6XbF1kc5mH3XcOglMzZbLsvIsUNc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzbWNIR9/Q8xVz1kpqyOtyQAfSsofxZXJ+0IymTo4CoY+1/kgC
	XAz23W2R/YXa1eteXlrFVtuq8anLLcJmejoInDIsYiR0AcE2M4sA
X-Google-Smtp-Source: AGHT+IEOVdMM8PcWZxl1hPvTCKwG2lQG4t9e4+Akb4lepcYLEtP3F6f9LMfzoo6aVvTlm9dEICcxmg==
X-Received: by 2002:a05:6a00:21d5:b0:71e:14c:8d31 with SMTP id d2e1a72fcca58-71e4c17c145mr21607003b3a.16.1729052744203;
        Tue, 15 Oct 2024 21:25:44 -0700 (PDT)
Received: from ?IPV6:2409:40c0:11a6:bd6f:94e5:e911:e544:8911? ([2409:40c0:11a6:bd6f:94e5:e911:e544:8911])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773a2ffbsm2173954b3a.81.2024.10.15.21.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 21:25:43 -0700 (PDT)
Message-ID: <c824a2f7-e661-4d8a-a11d-a4df0aeff720@gmail.com>
Date: Wed, 16 Oct 2024 09:55:37 +0530
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH] leds: Fix uninitialized variable 'ret' in
 mt6370_mc_pattern_clear
To: Lee Jones <lee@kernel.org>
Cc: pavel@ucw.cz, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241006131337.48442-1-surajsonawane0215@gmail.com>
 <172863776565.3130628.18378710932238203204.b4-ty@kernel.org>
 <7274be28-aefe-49b1-b8e1-dd1c2bad96d0@gmail.com>
 <20241015085842.GC8348@google.com>
Content-Language: en-US
From: Suraj Sonawane <surajsonawane0215@gmail.com>
In-Reply-To: <20241015085842.GC8348@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/10/24 14:28, Lee Jones wrote:
>> On 11/10/24 14:39, Lee Jones wrote:
>>> On Sun, 06 Oct 2024 18:43:37 +0530, SurajSonawane2415 wrote:
>>>> Fix the uninitialized symbol 'ret' in the function mt6370_mc_pattern_clear
>>>> to resolve the following warning:
>>>> drivers/leds/rgb/leds-mt6370-rgb.c:604 mt6370_mc_pattern_clear()
>>>> error: uninitialized symbol 'ret'.
>>>> Initialize 'ret' to 0 to prevent undefined behavior from uninitialized
>>>> access.
>>>>
>>>> [...]
>>> Applied, thanks!
>>>
>>> [1/1] leds: Fix uninitialized variable 'ret' in mt6370_mc_pattern_clear
>>>         commit: b5a5659aebfffbcddb81abafe042fb4044b6ff9e
>>>
>>> --
>>> Lee Jones [李琼斯]
>>>
>> Thank you! I'm glad the patch was applied. I'll ensure future patches follow
>> the necessary guidelines.
> Sorry, this is a tooling error.  The patch was not meant to be applied.
> 
> Please resubmit it using your updated .gitconfig file.
Thank you. I have updated my .gitconfig to use my real name "Suraj 
Sonawane" as requested and have resubmitted the patch.

Best regards,
Suraj Sonawane

