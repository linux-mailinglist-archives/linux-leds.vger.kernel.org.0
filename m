Return-Path: <linux-leds+bounces-6103-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F09C58B15
	for <lists+linux-leds@lfdr.de>; Thu, 13 Nov 2025 17:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 182C33515BA
	for <lists+linux-leds@lfdr.de>; Thu, 13 Nov 2025 16:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC333254BC;
	Thu, 13 Nov 2025 15:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gE9K287B"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4866E2F90C5;
	Thu, 13 Nov 2025 15:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763049382; cv=none; b=QZT4jzxEqAaKkh4jznMJvbyMWovIjujxWTWMd+lwgWmIQ1Dkp1CvCvkPkUKMKFQzQaPI/5MhSybLtZghIVbBFlXpv2Lw0wU0T948dbp252AW2GeqXj3uOeNQC42tyNPt4rw1YWCO4+TsJjkMFGGJcSrByMk8ZJH1tFtzhI4Tb7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763049382; c=relaxed/simple;
	bh=tJibYAQY+S5lOPWCgNk6mfELSA3HxfVzpagj661netk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UEEFJVO++kCLeA0xKKGcBCTjyMorYx6m9ap9/Q32bX9I3Zrmi4wyYfoSqH9eLWVB9p7oBtWw6xQwcc0naZM7kO5vyTy/eGMsZiYm6z8UZMbbqgb0yQ+YDh4M40wiFJzvomOD5EYfrjxG6DLKoKeOvMMm3nezXHqqYWXyfo7dxBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gE9K287B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4CC1C4CEF5;
	Thu, 13 Nov 2025 15:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763049381;
	bh=tJibYAQY+S5lOPWCgNk6mfELSA3HxfVzpagj661netk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gE9K287Bj1AgbSsP/zRWIEzBAfjzegR5ZIKpYo6p3HM5S9+BcW/rUpHb2zCf77d2P
	 dbkDj2rIOo6OYwdrCEgU6tr4MzotLpPiAiz6k/NKVNVFAC+luIPNCqLWwl5uQklzc0
	 sMuOEDGY1YPPOWrM+gbFRC1JPiMoKLcTs+sV+PD3QXILH6Hx1Sg/38lwQlGqthBVHl
	 kycwRlClLS3O5hoBYtK890OOjfnIIDLIqgAtUK5aI7RWqS0F4uNFpRKHZZhIK1aIBG
	 bt20JCX1vgeGv8gV2EbDxuzNahj1bGPEsVa19XcR7CINLMYCjV4IoSxo8t8AFUuH4W
	 qwrDGQqEmou5g==
From: Lee Jones <lee@kernel.org>
To: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Marco Crivellari <marco.crivellari@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Pavel Machek <pavel@kernel.org>, 
 Lee Jones <lee@kernel.org>
In-Reply-To: <20251105111924.141555-1-marco.crivellari@suse.com>
References: <20251105111924.141555-1-marco.crivellari@suse.com>
Subject: Re: (subset) [PATCH] leds: trigger: replace use of system_wq with
 system_percpu_wq
Message-Id: <176304937940.1554738.14671753263913309288.b4-ty@kernel.org>
Date: Thu, 13 Nov 2025 15:56:19 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Wed, 05 Nov 2025 12:19:24 +0100, Marco Crivellari wrote:
> Currently if a user enqueues a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> 
> This lack of consistency cannot be addressed without refactoring the API.
> 
> [...]

Applied, thanks!

[1/1] leds: trigger: replace use of system_wq with system_percpu_wq
      commit: 88aa23c12888348bb4910e75a6088f0affc86923

--
Lee Jones [李琼斯]


