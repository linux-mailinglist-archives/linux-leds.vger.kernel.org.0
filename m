Return-Path: <linux-leds+bounces-3679-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 240959F79CA
	for <lists+linux-leds@lfdr.de>; Thu, 19 Dec 2024 11:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 219E616E7A0
	for <lists+linux-leds@lfdr.de>; Thu, 19 Dec 2024 10:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C29DE222D61;
	Thu, 19 Dec 2024 10:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="R/9fvMTZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7ED78F24
	for <linux-leds@vger.kernel.org>; Thu, 19 Dec 2024 10:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734605162; cv=none; b=oEvGOwYKxTOjqq7Pt2pW42KNzZTtlbyFU8EeacjlR1kTN7XALPkwG5QC4bIL0Q8x0vNh3BXJhC7Z/6NJ4wOAkqpZioUPvYrBzoEQsHCiwvD0zt4tYdYKbD/Q+AFKRcXWS1fXN3JLfoIs5lQrK6PvEigPIPl8RNq5gH/xdbGNBY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734605162; c=relaxed/simple;
	bh=kfAWATXJKBJ8RGjGiVBA7vXcVCClGQxAViZsQ/ciTpM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JtacbnjsAS3f8uP5mqSSmWqxlFYZ5qtdZ9Mxg90w9yK/7JpyVH+wVqV2jhW7W/tgEj9cy++OtghGgUF/fXuiYqQxNJXJvXkyVrMyHXrL0TuDpoCzuwXSV8frVF07JFOys3gchLSgzZ1xEwdWOKy5hqYkDd2qRonQcBXN7mUQZR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=R/9fvMTZ; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d3d14336f0so981256a12.3
        for <linux-leds@vger.kernel.org>; Thu, 19 Dec 2024 02:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1734605158; x=1735209958; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dAHd+EbTV94znxZS0/H2KKVGTBswxUh/P1a9OtmVIVc=;
        b=R/9fvMTZoKiSvxgqzcRm9apRJ7tG1fkJkZJ0IBeGU1olD1Z2wxcATns4ZzFBZbz3hO
         9scSc6dMHElWT/RC81um7js2wLyHOSldfNcwTiq12i4WsRJMQ88xH7dhdcBs8971odCU
         WChkMuIdefQaKL2fpvHw/0ZyC73soO28A72acGeT8Iyng4VbZNYn2SfY+XCuk2djR+JT
         ZaxuGz/14MPNKFqBY4kd3knOVG/Kt4yjR5j3PLPFGrlzR8RhaNkGX//zApD9zKNkr/MF
         KWp1qWE1zpervsa5KhDYHVsyLsNn7L2tvveCCGRbPusyXVEuM8gNOoSefxiRt1m1BCtb
         sZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734605158; x=1735209958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAHd+EbTV94znxZS0/H2KKVGTBswxUh/P1a9OtmVIVc=;
        b=FfLz7XodBQ6TfE+RudijAo+vedI9rO9B9LDo6v7lgcp/0f+0m+/+oTLaY6ud80Hmww
         f4ObwvP9ebl4lPeRLijAN7h92mPLgY3vuszYWzNCcggObWryk1lmHCdZzm9lvXV/cY8D
         /H2y9nl8I5295yzx0AOGrQSP8LdrVUhUxJXwnWO9CeCgbhQmn/Zlm+17S8fDA1LtnI/0
         8y6elYKJgRfno9rkjMEf3HE4mAzDag8pUfrX7OF2rKEBIV/JhrFKyRgyv0Z5tcRK1CkO
         Dkfoo34CWrdstctOnED+ldfjmPfHcVXfErpq4JEnwf8oaYebAckK3j1W8BW3XJuUDtfU
         pq6A==
X-Forwarded-Encrypted: i=1; AJvYcCWQdBE4QAvHHNzKli+5kn/cIWysbWSa4g7JtlipMV1Zmrrrc8Z7G1j2fZLYu0dZYKVFOphqbA5lK0Mz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+sJTBcMECuRYckZrJNBxhQqEAvJYlXVHVGIlzFil81amapLbQ
	t6QRlIC9KoOXhDca46V83zY7uVmysqo3PaixS1c1jfHbu5d7gKB1JMhAbQnn61gMGiNIo/0PVQp
	e+HA5HFUuCkBPfg7MVBqyevHySQ9ZUwofWt92Q+TolcA2fZMZEMJaGbPi5UJ1kE9eXizsjqTXck
	87tQqW6TrnGw1EOiVBhnx9mpfk
X-Gm-Gg: ASbGnctsxor64KKg7UaYL3h3QjF4Q0dfibcw68flrjK7iqVbBJlmYdUALyRu4ef6YfO
	Ta6GxenWApHi/wf4DA08QI0Yx/AXNNN16ohCFxze2CI5xt5GT2RTCMsfuqdusyAEYAQKGAwiRaj
	XaL/lrmeA/c56BIVJhK6r0dMmYdcuZb/3pHc3P3lrzK7HpkOsfr4P+DFuc8+QZVmNRLKMoc3Ygy
	MZQ/FN9f2dqqwGdGuM4wq9uuamTlpEWy+MOMDtNmjod0vt/qd/MrUJRDEsuvNn/LtgnmXyCyMDj
	HP0Eqd13kNsOAyWCjikTgNdQ
X-Google-Smtp-Source: AGHT+IGGzXK6nUcQjtIbuDIGRxih07nRmy8iLhfk2fbAs5JzbyHv7qJEr2ajzXdsqNw5Q0QRupGTaA==
X-Received: by 2002:a05:6402:4025:b0:5d0:aa2d:6eee with SMTP id 4fb4d7f45d1cf-5d80261d527mr2647404a12.26.1734605158033;
        Thu, 19 Dec 2024 02:45:58 -0800 (PST)
Received: from admins-Air ([2a02:810d:aec0:2a54:946f:b35a:e674:a0cd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80675a5a8sm514166a12.13.2024.12.19.02.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 02:45:57 -0800 (PST)
Date: Thu, 19 Dec 2024 11:45:50 +0100
From: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
To: lee@kernel.org, pavel@ucw.cz, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v10 2/3] dt-bindings: leds: Add LED1202 LED Controller
Message-ID: <Z2P5XvxCjAPmiFDI@admins-Air>
References: <20241218182001.41476-1-vicentiu.galanopulo@remote-tech.co.uk>
 <20241218182001.41476-3-vicentiu.galanopulo@remote-tech.co.uk>
 <c93c89c2-7188-4b17-ab3f-a3d2f1972a21@linaro.org>
 <20241219082840.GN2418536@google.com>
 <e911eda1-fec3-4d2e-bb8b-655f6661825c@linaro.org>
 <20241219084227.GO2418536@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219084227.GO2418536@google.com>

On Thu, Dec 19, 2024 at 08:42:27AM +0000, Lee Jones wrote:
> On Thu, 19 Dec 2024, Krzysztof Kozlowski wrote:
> 
> > On 19/12/2024 09:28, Lee Jones wrote:
> > > On Thu, 19 Dec 2024, Krzysztof Kozlowski wrote:
> > > 
> > >> On 18/12/2024 19:19, Vicentiu Galanopulo wrote:
> > >>> The LED1202 is a 12-channel low quiescent current LED driver with:
> > >>>   * Supply range from 2.6 V to 5 V
> > >>>   * 20 mA current capability per channel
> > >>>   * 1.8 V compatible I2C control interface
> > >>>   * 8-bit analog dimming individual control
> > >>>   * 12-bit local PWM resolution
> > >>>   * 8 programmable patterns
> > >>>
> > >>> If the led node is present in the controller then the channel is
> > >>> set to active.
> > >>>
> > >>> Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
> > >>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > >>> ---
> > >> Stop sending the same 5 times to people.

This is the command I used:
   $ git send-email --to-cmd='./scripts/get_maintainer.pl --norolestats v11/v11-000*' v11/v11-000*

I received the submitting only once and I do not know why it sent you 5 times.







