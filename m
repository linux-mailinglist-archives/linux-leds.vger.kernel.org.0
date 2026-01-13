Return-Path: <linux-leds+bounces-6635-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A18D18B74
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jan 2026 13:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39474303C2AC
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jan 2026 12:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D90F538F24F;
	Tue, 13 Jan 2026 12:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r6oVvW1b"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B671038F24C;
	Tue, 13 Jan 2026 12:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307388; cv=none; b=Y9wCxpHliNIaUhwdzZt3j5/2FTVMx4XqS1s41fWYBBElgor5LlNtMjBU0pxkOxaHZofGrNJp1fy69DkcRekXgMUqSkacKjvAYSfZaIF1MFx+MJnL/eE7Wea7UGL/yfnv921lM/jr2e80b9/QagrtvHQpU7OC4l8+wKoon4w8GYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307388; c=relaxed/simple;
	bh=LD9cuGtLZv0WbQw7pIlBAvGTjrjoxa43XGOeJ3o9DP8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HuRC6XXti7C23WtKg9+P5ejLBZxvDFdQ/dxULRqgpkcfDZs5oC6gLE53IQvgLeeapgwYtb3RUNYpMHKKq3VUT4gJa4MKa+wE8DK9ltyxkml7KqoWv6et39TymsecyIC0d0ydVh0YirngtYvtXLDxHEM2b3EgLS5UzEy3XNSETOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r6oVvW1b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C67C19422;
	Tue, 13 Jan 2026 12:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768307388;
	bh=LD9cuGtLZv0WbQw7pIlBAvGTjrjoxa43XGOeJ3o9DP8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=r6oVvW1b3YIc/m1LUylMsiwiANBO6PT4oXcWgR0SLeFyGOZCVEbvOlaCbvOsgmC6K
	 /qLfh0ZwDQXccRIViXa96ex2W0njfiq/xplAkRXxIVH4cb3XPn2V4tcHpRLT3cwAMC
	 0RpwqIn4ciqkLKfWqc5wfkmtScQBeawpQR9Ww33iyJhKb/YEZ6WHoFUS+Ml4GVb4V9
	 Swlcf2o1REIWpcSvrusohIePkaHpJPWCXsZAaYfQ+7Sda0Wqdhb8dia45N+s6At1Vr
	 kzdJb+y8R8Lm7XjvLXWqH+OeQC66eRMk3mihTHwkDzeRs9/vkFIJJ4F9dIIp4xi3C+
	 Sj7SEBg8Q+kgw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@kernel.org, Haotian Zhang <vulab@iscas.ac.cn>
Cc: abel.vesa@linaro.org, marijn.suijten@somainline.org, sre@kernel.org, 
 andersson@kernel.org, anjelique.melendez@oss.qualcomm.com, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260108175133.638-1-vulab@iscas.ac.cn>
References: <20260108175133.638-1-vulab@iscas.ac.cn>
Subject: Re: (subset) [PATCH v2] leds: qcom-lpg: Check the return value of
 regmap_bulk_write()
Message-Id: <176830738601.2840040.12406208881450047670.b4-ty@kernel.org>
Date: Tue, 13 Jan 2026 12:29:46 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Fri, 09 Jan 2026 01:51:33 +0800, Haotian Zhang wrote:
> The lpg_lut_store() function currently ignores the return value of
> regmap_bulk_write() and always returns 0. This can cause hardware write
> failures to go undetected, leading the caller to believe LUT programming
> succeeded when it may have failed.
> 
> Check the return value of regmap_bulk_write() in lpg_lut_store and return
> the error to the caller on failure.
> 
> [...]

Applied, thanks!

[1/1] leds: qcom-lpg: Check the return value of regmap_bulk_write()
      commit: 33e822f6f4eba2cfbd09ffd080af221cf8c542b2

--
Lee Jones [李琼斯]


