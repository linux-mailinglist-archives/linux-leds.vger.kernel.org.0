Return-Path: <linux-leds+bounces-5866-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B1275C01478
	for <lists+linux-leds@lfdr.de>; Thu, 23 Oct 2025 15:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 01CF23451E7
	for <lists+linux-leds@lfdr.de>; Thu, 23 Oct 2025 13:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB66314A93;
	Thu, 23 Oct 2025 13:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jKEsPPiS"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104B02F6187;
	Thu, 23 Oct 2025 13:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761225235; cv=none; b=o9mFed5kX6/RRuMbqV7Pfd2jWt67n9yk/Ti23+fYQUqJ14m7DsJW9ncPCjd3mhvHh98uRChDD/6pPOX4+mjSU1YUlrrPR70YTRXjNBhZM+hbD/Qw/OFZ5l9NDgf3nz9YECNnNSey3BNYene+lrAJn2v1R93hHcH8fIOFs5iWnc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761225235; c=relaxed/simple;
	bh=bYxqUTJiDijzBo7ZPyKbQWyYVTphWzShBcErYhUGs4M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nSFMa8KDpl7Qe4g20c1XKTSqE69hOf+NlDcE83EBwjOvUMBOvoPyz9guCpjVzoDUFSV2S5Keh3uUOEzsm3agRofoUly4J9pkiP681V4Cny8KyceUiAQtFpPOdSJ0/YpieRP+oy9dZ2KKh2Not3eyy48P8foAJ8qcwuOrGxCd0q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jKEsPPiS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27CA2C4CEE7;
	Thu, 23 Oct 2025 13:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761225234;
	bh=bYxqUTJiDijzBo7ZPyKbQWyYVTphWzShBcErYhUGs4M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jKEsPPiST47bxEp/2C50x0AzvVHWlJaOji9CycU/lwi3IWx/GZ1wlSWQTn7ggDsre
	 9elb2Z0Rwi6EXjJYkyer+lspe78kefEUKpkEY/TBS3CcYpg2HKC4qTQChVEMb3+wwf
	 WB7gTqk0nAmTCpFy0ZUO6MkclWl/IJ96t2H3nEAJkRVIq/xrJ3gjXKynm3WZsnCmkX
	 EKQICJdmE2jQcBnfrpAVyPV9vLo5D0+NK+y+rW8hHqIErXgd/cQZSiZInokFR610H6
	 6nSQ/L9QmKqps9xuYee6jkNX5hoayG+cKVTVbDR326lUYdfqPZ9smKljJoYfUgxRFv
	 ZmqR0liP8WYWg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Christian Hitz <christian@klarinett.li>
Cc: Christian Hitz <christian.hitz@bbv.ch>, stable@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251008123222.1117331-1-christian@klarinett.li>
References: <20251008123222.1117331-1-christian@klarinett.li>
Subject: Re: (subset) [PATCH] leds: leds-lp50xx: allow LED 0 to be added to
 module bank
Message-Id: <176122523290.2158822.16360314050644425886.b4-ty@kernel.org>
Date: Thu, 23 Oct 2025 14:13:52 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Wed, 08 Oct 2025 14:32:21 +0200, Christian Hitz wrote:
> led_banks contains LED module number(s) that should be grouped into the
> module bank. led_banks is 0-initialized.
> By checking the led_banks entries for 0, un-set entries are detected.
> But a 0-entry also indicates that LED module 0 should be grouped into the
> module bank.
> 
> By only iterating over the available entries no check for unused entries
> is required and LED module 0 can be added to bank.
> 
> [...]

Applied, thanks!

[1/1] leds: leds-lp50xx: allow LED 0 to be added to module bank
      commit: 26fe74d598c32e7bc6f150edfc4aa43e1bee55db

--
Lee Jones [李琼斯]


