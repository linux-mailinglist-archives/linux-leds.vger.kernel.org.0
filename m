Return-Path: <linux-leds+bounces-4503-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D711A93CAA
	for <lists+linux-leds@lfdr.de>; Fri, 18 Apr 2025 20:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DF5C1B61614
	for <lists+linux-leds@lfdr.de>; Fri, 18 Apr 2025 18:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D03F2222D2;
	Fri, 18 Apr 2025 18:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWKsCClJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8502E215795;
	Fri, 18 Apr 2025 18:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745000217; cv=none; b=YeVtndBYyj7AXL38reh5O1cxDXKlGca1JrlSA5u74l8xLRHXl3N7YwLHjfIT64AJPUwWAoSuWqdL6dX4pVwrul4mdyxELNvnvP6AHhMxLEB/vsVw85NK7WrPQsPv+N3BuTEfTJPQbh6tv7RXcef6RZQOnxb3TyCY7O6KeLhv8Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745000217; c=relaxed/simple;
	bh=UAlPrAxnp/DLqF+0rLeMaenQeG5p6cS3srtCNlyxhGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TkAwD30cHHApYcoGjTMfJmWsw1kkU43Ik2gi2e15lOtpcKrIwGCzUBucSWmo8fkj1uPv8o+l60UZ1EklZAK/VNYqdtSBZa8zMAZIqs22JH0v8e7ott+0pI8qfnkR93YW7KvxNfY8Fxa2JyPnNs6VhBaS3Iii1queCr0IcXIT2Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWKsCClJ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-73972a54919so1868039b3a.3;
        Fri, 18 Apr 2025 11:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745000216; x=1745605016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtR9yi+Z296JQYsaYU+wI+paZc4GBr03eUA9SnJEG0s=;
        b=iWKsCClJyP+kHRGa1OWFPEIZcMXw0udk+eUXArIjIh2kzPCSJFLW/5ZaPbS5E5pVlE
         1a8Smp8IcL2CTHqtdW9d6qCLYHkpVIfQ1OOUGi13kfxFLi/2pwS0drLFZNqh8jsIM6x3
         9D0wY6qxkK3ZmqPx/lJPbuljbpu3LUSKQwQ3sBmD01P0AbkAwWgAoNn+0x0KSSevEzud
         Exb/KheIocIwzdGVHrqmVAbAddC8bgHp0RfK0sxad/ZykYtxnKxBrlohh8AutRvZ568i
         VPuE8cTaizyXsNgwsUTUO356ERZwi9QFfo1KTd8PSckTEftEKvWfrLQSoBBgFuZHQ+Gv
         5xhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745000216; x=1745605016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtR9yi+Z296JQYsaYU+wI+paZc4GBr03eUA9SnJEG0s=;
        b=Gd6dZ6pypa3DCErUj+9TH3N/MpnxN6rDmPIDihSrq19rc2Oj17NRxlsOEzkyUIhlQd
         vld5meKkOkdPzTzatp2YRjbFiq8Jkg+Gs88aHHiS/IKm/JNoZo4PtabZwPzDfoGBCWEM
         3w3I/jQk79vSHmSLWRF/WNckv5Cx6ashyrVP5jz2t4BBqFydnwjXn7XqhWkPXzjGlC0q
         R0tN0YqmIpLWrgADSlOkPf3ee8MAlIXwgHZKCzTZDTNkKHQWNpdSlpOd83Qm0PH7vknx
         Zn9l7m/1dgvgwo8mY+idHVjvwTT4h3EZ8zivVwUk2ASMkFAeeDMbuNzM6eJUMl+sfIXJ
         Rs4A==
X-Forwarded-Encrypted: i=1; AJvYcCU5atMSF5a5zaqn1jq83bPjgDoZ9a6t38HHTBP5MADkit8tu/dfwO3cbvSlGwlmadXndUXEs4yHsapGu2IC@vger.kernel.org, AJvYcCVVLJ8f9tUCeOk749Q32G4QSySdD8mNqGaJFL0URGpz2X233JzT4tsgtNPiIHAYCFOSk/0O8zfYSJHrpW8=@vger.kernel.org, AJvYcCWIGcz0hbzU3/clPuyFe7wRs15nBX2YYQfhiGpvUGAWDa3AL4BvaTn9czk5K8JMkM1rmHA2tDJ9W1xb/w==@vger.kernel.org, AJvYcCX0WnWx76FmwY3ZGYlyqO+yk0bXO3RoPrH9fBvseT6ksf8DdX3MeqgFLVhcz+HSeliiip2J9STJSa7e@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9GQjVwyMLDJ5EEowVyOLUzgLeZfGwEGRxuYM1z4nz9fFFVCCP
	VWMW/qTU7//kD4XUzCcGxre/uG7QucB3Ii1mPO2xO2HxDGBQkpZc
X-Gm-Gg: ASbGnctsEFAtryZefhFdf6NHtwrdTFOtvQvusRCy70gZuQBvW1mvPPzadsWqVv55SPB
	/u3N5lH4wultka1jg416noskrVGNCKvdYzhLZKk0ld4aDArcW7xEgov/D3Ep6IM5pKKUKzLAaTC
	iMXlVop33TGxwWJ/1OgmwI/Kzc/pgPkRqT+N0fVvkKHhKtAejmGyxzAaJK7U0UbWns/dc/L2rtY
	exlwfiSjmg9oMLQvSSnNnzD9un3kqlcz7WBJAd7qmNofxeRKHs06b2HYfNQFs5z36KmMdduttSs
	YzxQbVEQHbstMY46PYIBAkHmXg9i8/Q1IsKOA4c=
X-Google-Smtp-Source: AGHT+IEgYyHoFNXqS+ng4zUSLjzFVHFHhp6c/GtXYk71PYeQLEijwI6Tlhvtyx+SG+0mbA7k2GDG+A==
X-Received: by 2002:a17:90b:5884:b0:2fe:a545:4c84 with SMTP id 98e67ed59e1d1-3087bcc72c1mr4640664a91.34.1745000215613;
        Fri, 18 Apr 2025 11:16:55 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df25d80sm1560674a91.25.2025.04.18.11.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 11:16:55 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: krzk@kernel.org
Cc: conor+dt@kernel.org,
	danielt@kernel.org,
	deller@gmx.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	jingoohan1@gmail.com,
	krzk+dt@kernel.org,
	lee@kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	lujianhua000@gmail.com,
	mitltlatltl@gmail.com,
	pavel@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH 2/4] backlight: ktz8866: add slave handler
Date: Sat, 19 Apr 2025 02:14:41 +0800
Message-ID: <20250418181442.207436-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <eb23737f-5b6c-47fd-8b39-637e059bd5f1@kernel.org>
References: <eb23737f-5b6c-47fd-8b39-637e059bd5f1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Apr 7, 2025 at 6:00 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 07/04/2025 11:51, Pengyu Luo wrote:
> > Kinetic ktz8866, found in many android devices, nowadays, some oem use
> > dual ktz8866 to support a larger panel and  higher brightness, original
> > driver would only handle half backlight region on these devices,
> > registering it twice is unreasonable, so adding the slave handler to
> > support it.

[...]

> 
> I wrote on IRC - phandle to express the relationship between hardware -
> and I do not see it implemented.
> 
> If you have devices depending on each other, you need to express it -
> for links, for resource dependencies etc. phandle is for that usually.
> Or OF graph. Or parent-child relationship.
> 

I got you now, as a non-native speaker, I often misunderstood the first
time, you expected that accessing node phandle in relationship or graph
way, I did only access node phandle regardless of relationship or graph
description, I only implied it in compatible string, but there would be
a better way.

> You did not provide any description of the hardware in the binding, so I
> really do not have any idea what is this setup thus how to represent it.
> Use hardware terms, diagrams etc to explain the hardware in the bindings
> commit. What are the addresses? Are there any shared resources? What
> buses are devices sitting on, etc.

Agree.

Best wishes,
Pengyu

