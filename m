Return-Path: <linux-leds+bounces-3587-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E64029EF808
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2024 18:38:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF25C188C7BA
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2024 17:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B2F21E085;
	Thu, 12 Dec 2024 17:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BK0evGY3"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CC2216E3B;
	Thu, 12 Dec 2024 17:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734024518; cv=none; b=cnrP2maWiCPpO0udgwv9RE1hyCPlMeEX7hHvPw5B48emIBBADEWEOyyEsWZmuyhacZGn3MbK21AiOEco+FKPDJXnbNGcmyNajjMZ803TwbMqex+8pcqrz/E6jGp9mmp5YnvX3g0MUODvrx4NqQEL5s42wPIsFpmzGzluKo8zuAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734024518; c=relaxed/simple;
	bh=boegi0C3d9DusCgBpxBTgyxmZlLhzf+b0ydQAilLHWU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Xu/KYKAxSHyNmfGMM56Ut4pWeQkC3zugCcNBA2hE3ukImu/aj0a4v7WjFwe28Wo2+LtHan2BJ3FlXzqvGoJDG2qgDQUJeVL+EFSgGGqCtXXaHmcqbrLNmbyXTqwj+HcGx3AKGtDJkgpC30vcuFo5Jqa9ZyzIC098ZDNjUUfs188=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BK0evGY3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42DBC4CED0;
	Thu, 12 Dec 2024 17:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734024517;
	bh=boegi0C3d9DusCgBpxBTgyxmZlLhzf+b0ydQAilLHWU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BK0evGY3lqolBrwBPYZRGUhoN4epgL3Abn8iUJNBk048dEr1izbgcx54V6vLi1CjK
	 YkVhwtVddkzVJm487dKxFTy8fyqycBdgfmwHkklUwkFCZbgi/Q3xF8I8wY71UYO+5k
	 h/VGTfJ9p4jZfC2bAA5eG4vGMeQ2WXO9RL8QuUuBmUXU4qP+hB3OhI5fEO7T1kFknD
	 UUcN4LswaCz7eUrwO2GriopUjiQKAJ+1NqGAMxgqbZmoaAz29I3Mh5UqfqW5y4Xi3m
	 7/24T0RIldiPMl0uGSJBI6C5kmymgM1/0JW7r+QxoXNjPE0oOYCW7pfKP/oXxYvMbl
	 uq5lStZrDiIdQ==
From: Lee Jones <lee@kernel.org>
To: pavel@ucw.cz, Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20241122064626.4680-1-zhujun2@cmss.chinamobile.com>
References: <20241122064626.4680-1-zhujun2@cmss.chinamobile.com>
Subject: Re: (subset) [PATCH] leds: ledtrig-activity: Fix the wrong format
 specifier
Message-Id: <173402451642.2240304.2498698162432656151.b4-ty@kernel.org>
Date: Thu, 12 Dec 2024 17:28:36 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 21 Nov 2024 22:46:26 -0800, Zhu Jun wrote:
> The format specifier of "signed int" in sprintf() should be "%d", not
> "%u".
> 
> 

Applied, thanks!

[1/1] leds: ledtrig-activity: Fix the wrong format specifier
      commit: 6fcafd33d2f85f0ffc1fc64e2b1ea607d0e75037

--
Lee Jones [李琼斯]


