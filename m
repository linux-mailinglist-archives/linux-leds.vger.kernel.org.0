Return-Path: <linux-leds+bounces-1876-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 351D0903E73
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jun 2024 16:12:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45DCE1C22638
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jun 2024 14:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B93BC17D88B;
	Tue, 11 Jun 2024 14:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="focMhIO2"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F376517D88C;
	Tue, 11 Jun 2024 14:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718115168; cv=none; b=Mu811sgH5Y3bzmPtVWiVA4AmgFxOaZE8d/mamR4RH/eB0QxdNlOsk0X4saybmvvwKgBZO1rCSlyaGZgdSJcRh3Zo9JvqGvfg/7A9k0lwSSlb50KXV6dQBKAbJRTOwidOp8/Xqgt//HBcXbCBftdHgpAVvq0GVcPC37skEPluCc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718115168; c=relaxed/simple;
	bh=uwcdBzLuAxEDrNoXrhjSgpM2Fga3hryzixwO3pPxk/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hL+9ei2/c+ju5pMt60e95cGCxpt5VEDEFhYpSL2aU57wfKnAjdXC9Sa8/DBGfRGSyaKT6SXycwWUrKRjgLsr5No0kwuuDYhIC1zFD0/hjVyveoDLgb9rD7b0rdALFnTJvYCpWsTiWSx6UaIYuPFYn0mWDQUzbkDGhPxVNzLRV+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=focMhIO2; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2eabd22d441so91054971fa.2;
        Tue, 11 Jun 2024 07:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718115165; x=1718719965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RGZsWMQxIR/8a9H8paH0XFiZvIlanvQPzCmlVbwusdU=;
        b=focMhIO23gjgssmwHEVF36RM3pNmCQ56oJkQPiezfRVIj22rUDggYATELGrvql/TO7
         8QwVj9g63tULkNfT3WGsOZwmY5xpElCqinacNMNVVd8MY8T2THh7iWWhyY/8/aXfgBBu
         f+D2x8IUMqgtTFjQDxchwccN/UI2M3SiMMCFiDV4SsjLIfuzuZXojtuSG2O97JGWfkWJ
         xQOddafsWeNXypYEAej1xo5L3DZUMRoqjUin5nahe1MI2rV/JovdNCCRYqo2KRkPtlFi
         WPuq3uXELcliLnkB5Bk3hEa0mkybgOTQz6ax55xjtbsyjHD2hvbrtk54hGlcTROV4ZQf
         dxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718115165; x=1718719965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RGZsWMQxIR/8a9H8paH0XFiZvIlanvQPzCmlVbwusdU=;
        b=R4G78RK+ZAuLyQMXThwcP6mBIFFC7reFlujkDTWfK0GYHkPt/5yOnE2mw/QHbda3Wx
         x0c88rCvcWimbYeAQaeuYlomyhJT87Qbq/LarS7lYZG/bxxGhUyX1rNklXuHK8mHFjAy
         toEkbtUn+2O5M/XGInTtbfC8MgyhMGE9hNq4VzR7CbsWmnYisF1LRSIc6kVNrxja1SLd
         sej+eUNxTJ7sXcB/Gbm+R3UhSBLxaiubdqV/WGuwIzMhWpeqdtN2OUQFOKGrq2PhqYlW
         WHxqV/xiU5qKnpdeD5/0S4uM/o2iCuCeAPHzFun5SezFIibd6ClF7+zHoYotzO2eXLu6
         sJpA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ7/6/lP+21zoLs4Fyin+KRNAV22X7a7pDOFcgXxz/jDfzVmcaV/P45h9HaUvJXRM8jwCVTZvhOQBhYUYE46aE6jAO0v+/GFzgAlGVvNdkgEeqoz9c97z20vFfo7OeLJyMqqarCQLP1A==
X-Gm-Message-State: AOJu0YzvPFt0uRNOvHrC7km199wU6z8/bL1r+X/fwhgxFc8s3IX8Hfn8
	bOl6jFUm4AZAIPz4QxXSJUPMMbdRRwWT5cWZ5TGSVz9ib+vX9TT0
X-Google-Smtp-Source: AGHT+IGuq4XXKdcSy2MRECTQb8OvnrexiaWWjJespHlYnvTZ0wLoCtN53WXIbcE0kkCOgg4nKbvssA==
X-Received: by 2002:a2e:3612:0:b0:2eb:17fe:a144 with SMTP id 38308e7fff4ca-2eb17fea1c5mr62244931fa.34.1718115164779;
        Tue, 11 Jun 2024 07:12:44 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:89c3:827b:2198:62f2? (2a02-8389-41cf-e200-89c3-827b-2198-62f2.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:89c3:827b:2198:62f2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6effb9cd7asm457716466b.208.2024.06.11.07.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 07:12:44 -0700 (PDT)
Message-ID: <233d56de-8d5d-4bad-a380-45321a2d86ac@gmail.com>
Date: Tue, 11 Jun 2024 16:12:42 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: mt6360: fix memory leak in
 mt6360_init_isnk_properties()
To: Markus Elfring <Markus.Elfring@web.de>, linux-leds@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Pavel Machek <pavel@ucw.cz>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20240611-leds-mt6360-memleak-v1-1-93642eb5011e@gmail.com>
 <010b1c91-fbde-4b01-a92e-8c14751c7699@web.de>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <010b1c91-fbde-4b01-a92e-8c14751c7699@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/06/2024 16:01, Markus Elfring wrote:
> …
>> Add the missing calls to fwnode_handle_put(child) to avoid memory leaks
>> in the error paths.
> 
> I suggest to apply a goto chain for a while.
> https://wiki.sei.cmu.edu/confluence/display/c/MEM12-C.+Consider+using+a+goto+chain+when+leaving+a+function+on+error+when+using+and+releasing+resources
> 
> Will the application of scope-based resource management become feasible with another delay?
> https://elixir.bootlin.com/linux/v6.10-rc3/source/include/linux/cleanup.h#L8
> 
> Regards,
> Markus

I considered that option too, but there is still no _scoped() variant of
the loop. The scoped version of the _available_ variant is being
discussed, though. Maybe that one could be used here if there is no need
to iterate over unavailable nodes.

We could not back port that solution anyway, so I would suggest this
solution (or the one with a goto), and then a separate patch to used a
scoped macro if preferred.

Best regards,
Javier Carrasco



