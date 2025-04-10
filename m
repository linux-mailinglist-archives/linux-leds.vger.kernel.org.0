Return-Path: <linux-leds+bounces-4453-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5119CA8407B
	for <lists+linux-leds@lfdr.de>; Thu, 10 Apr 2025 12:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1C1616F926
	for <lists+linux-leds@lfdr.de>; Thu, 10 Apr 2025 10:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D8B26E158;
	Thu, 10 Apr 2025 10:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUrDZSzU"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9B61E1E00;
	Thu, 10 Apr 2025 10:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744280549; cv=none; b=chYzo1Wn7iC+K2TZGEfz+mgEWigyCgBtchFlsmJTkUZVT3ARRsEG540B3LYm57M/bDTPcaFa/5Xl/p+L62kztUwYrTfO8aiKY7or/EWjXWUv4I1/Pnggw5+j3FPI5j8rG6Db0YpkuPZkopRwwLrWYlY7CZtGGx2NqiBrIEN49q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744280549; c=relaxed/simple;
	bh=8Ce156ePCB6yuaGjuvc6lemKLyv0wBCBVdwWIgaIHv0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jp09m1Y7qPnnNAwOjpnwpFxJZHTT5+vMjQOK983MMz9VqlgeWrQ50xGjZ2RS62Tj2GgEJCHrFDvmgxqMZnHekzXQwkdGz+d4l8s07z2sPmOQWh8ESa9bare9/6Fv6EzlX8zp7fyTneV/rhTL6+i2VQSpcGwqGAUEKPYCXjbEwWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUrDZSzU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982D3C4CEDD;
	Thu, 10 Apr 2025 10:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744280548;
	bh=8Ce156ePCB6yuaGjuvc6lemKLyv0wBCBVdwWIgaIHv0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OUrDZSzUZhHSAg7NyaQNylOb22pwCtSXF74808Vys0QyHqlK2WDSS1nQgsmvXRh8f
	 +9VAnQ9oRVDQrweoYy+6CygkLE3ZgChnG+vrnfjv2eX6fBRxxgkMOtvrEnuL3aXeB8
	 mDHfwywj5UamKR/6incKBUfWcO8zN06FTYcJBiPUMx2y2BW5kLo4xK4i9QITxu7yO0
	 I2Gu/vb1/r470Tpm+XrWP9f+GzdGb2rayGXLcVMfFQTfUHBp2lOBYsAQ0KSbbib4pt
	 4we4S3vurONEQ5ngI/VHnRJEM22I+CICBcXh6x8vHOS1V9WmCUSR758hK0dvHHZvi/
	 PaZBOdncCrqbA==
From: Lee Jones <lee@kernel.org>
To: Eddie James <eajames@linux.ibm.com>, Lee Jones <lee@kernel.org>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Pavel Machek <pavel@kernel.org>
In-Reply-To: <20250407151441.706378-1-andriy.shevchenko@linux.intel.com>
References: <20250407151441.706378-1-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v3 1/1] leds: pca955x: Avoid potential
 overflow when filling default_label
Message-Id: <174428054735.1712257.6284971422979346985.b4-ty@kernel.org>
Date: Thu, 10 Apr 2025 11:22:27 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Mon, 07 Apr 2025 18:13:26 +0300, Andy Shevchenko wrote:
> GCC compiler (Debian 14.2.0-17) is not happy about printing
> into a too short buffer (when build with `make W=1`):
> 
>   drivers/leds/leds-pca955x.c:554:33: note: ‘snprintf’ output between 2 and 12 bytes into a destination of size 8
> 
> Indeed, the buffer size is chosen based on some assumptions,
> while in general the assigned value might not fit (GCC can't
> prove it does).
> 
> [...]

Applied, thanks!

[1/1] leds: pca955x: Avoid potential overflow when filling default_label
      commit: 1463b1c5bb231a8d46dc9db1773a31167614f84b

--
Lee Jones [李琼斯]


