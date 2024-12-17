Return-Path: <linux-leds+bounces-3631-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 378819F4E64
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2024 15:52:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A031D7A1A96
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2024 14:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3BD1F7096;
	Tue, 17 Dec 2024 14:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XsKuApTO"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83A31F707A
	for <linux-leds@vger.kernel.org>; Tue, 17 Dec 2024 14:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734447080; cv=none; b=jhH2yGMsaQMNv6DBJfutNtEcEWHi8VK+6PXpmRQsvNdWV9Y+dx+1WrzPjxNsLkcP+fwFLMyNnlBTdOaJVa43n2W/kF6XnSSz4JwzcTRN8dWZtvkDZql/mnN6dGs0P3eOlhuqs2xHZ0GDq9elR14Su2pntDsXmumwA4EzeY2P3Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734447080; c=relaxed/simple;
	bh=SuhrBjPAVC4Kv5taf5JpcaY6y/AsIfx2zMg9VXDTGr0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ey9tlVelG5EJswXCTGA+TCeRfUjw4Z7GFzXQ5DgzETKOOrS1lijpOc59AAEve05m4Uq4zqqAlTz4+tflXgExhvbsP896p8rp2yMduZrbW7NYHydVF/NVtoGaXiPDWjLvAr2BG4nAFBge/b5mnx2gY6Tss7kiHacjBLmpiX/YXj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XsKuApTO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C41C4CED4;
	Tue, 17 Dec 2024 14:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734447078;
	bh=SuhrBjPAVC4Kv5taf5JpcaY6y/AsIfx2zMg9VXDTGr0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XsKuApTOk9A/cbZWr2UXYSR8Yw1WY4cBGl2JECFvQyKZuBuyQLqytVyjDJCK47ski
	 zEdW1jC6v0zvP6DKVTdwxpDjGBsi1Ak7g3XxOr99D31HGAEdH05jFHbH9ZAt/SsggR
	 4KR9pbL7SsZ6OPS6moNV1nPu7znacVya5uIqxUGLHvq/blpis4tS+r7aw4ewnFf8uG
	 S+/HpZ2jnQ3pnx1xOc5/PikLX47y1olwUXO71IOmSKtBg73ry2HH+SvgSqioalGxWi
	 z6vHqOQljD7IVvbUUKv1fMhnwPNqEhFkfP9kVS7rGM1Q1e2IzXvrYaro7di9tkDtHt
	 UqzkgtU0llbZw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-leds@vger.kernel.org
In-Reply-To: <20241215211323.23364-1-kabel@kernel.org>
References: <20241215211323.23364-1-kabel@kernel.org>
Subject: Re: (subset) [PATCH leds] turris-omnia-mcu-interface.h: Move macro
 definitions outside of enums
Message-Id: <173444707746.1862789.16584691908290757860.b4-ty@kernel.org>
Date: Tue, 17 Dec 2024 14:51:17 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Sun, 15 Dec 2024 22:13:23 +0100, Marek Behún wrote:
> Move the definitions of enumerator related macros outside of the
> enumerator definitions.
> 
> 

Applied, thanks!

[1/1] turris-omnia-mcu-interface.h: Move macro definitions outside of enums
      commit: 1c896113f04e34d0036ef506532d2e6cf77dd1e5

--
Lee Jones [李琼斯]


