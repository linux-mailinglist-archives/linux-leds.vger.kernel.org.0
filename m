Return-Path: <linux-leds+bounces-2041-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B69C8910091
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 11:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54C5CB23C5C
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 09:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603A91A4F37;
	Thu, 20 Jun 2024 09:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UwhJ+Cza"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9481A4F35
	for <linux-leds@vger.kernel.org>; Thu, 20 Jun 2024 09:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718876422; cv=none; b=lPmvw6GGkDdYUsKQUc1B7LhyuHV3qT9LhNITUGv3qlqxI+fmOMR0RYNUQGTMP5Tv3m+LP2INHc5+XH55RmRa7T9Q6wPoc4aZ1x79wMMmrqaa8LZl2H4w7hlldg/8iv8nSrOOllex34H/KO/iWQ6fgfjHkuZmq6FptUTF3BZHtpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718876422; c=relaxed/simple;
	bh=tVA9qUeJ6sz8i9Ki7cAHXb8SvZl05j1t0ac0tXv4COc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=alx34DxiyNUbDilP7gK5VCGx+Q9jVkfbTcYlSM1HdxUh+n14o/3Dv4VAaEL6fOmlGJMzW+qrHVtf1o8nape2bieE5wlrQhJ9/jILLhRn56fVXMEQ3rHd6jBe/2XZyGzqlNP4J6x4SvxgTn+K8QK8vLEalF62SG1YTKhGMV/Dh2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UwhJ+Cza; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C16C2BD10;
	Thu, 20 Jun 2024 09:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718876421;
	bh=tVA9qUeJ6sz8i9Ki7cAHXb8SvZl05j1t0ac0tXv4COc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UwhJ+CzapDjmOcB/QPn8DgC3YEWuKrd3+CYL0LZwaBbLR58rTEoV5w5eBddF4GX08
	 4GRUP3Pd3HuD+ucdojDADPo1vCcF8k46qmx4FNKoMitEl5EYEm0VVzRqY9d5eKpUV5
	 mYo4UYnyU4vi9Nbn/pietP8J27pNra8Ug9uFcCMlMAcMjLWq5XVYwzvEEaTjkX1VYL
	 zI5JNB2gmNLFNSFF/rO6G8rThDg+Ee5lU1vYxpZUk53HMGhgjbhuIPab/19d2UnC/9
	 XROTH1Fcb5XbSB9M4I1IqAB+VpigPtPsUU4KXqwdUxx9EpAYZJR/ITMM2RpVCf6UkM
	 45Nbw/lwbmbrQ==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Hans de Goede <hdegoede@redhat.com>
Cc: linux-leds@vger.kernel.org
In-Reply-To: <20240602160203.27339-2-hdegoede@redhat.com>
References: <20240602160203.27339-1-hdegoede@redhat.com>
 <20240602160203.27339-2-hdegoede@redhat.com>
Subject: Re: (subset) [PATCH 1/1] leds: trigger: input-events: Rewrite to
 fix a serious locking issue
Message-Id: <171887642092.1122039.9990181684991982824.b4-ty@kernel.org>
Date: Thu, 20 Jun 2024 10:40:20 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Sun, 02 Jun 2024 18:02:03 +0200, Hans de Goede wrote:
> The input subsystem registers LEDs with default triggers while holding
> the input_lock and input_register_handler() takes the input_lock this
> means that a triggers activate method cannot directly call
> input_register_handler() as the old ledtrig-input-events code is doing.
> 
> The initial implementation of the input-events trigger mainly did not use
> the simple LED trigger mechanism because that mechanism had an issue with
> the initial state of a newly activated LED not matching the last
> led_trigger_event() call for the trigger. This issue has been fixed in
> commit 822c91e72eac ("leds: trigger: Store brightness set by
> led_trigger_event()").
> 
> [...]

Applied, thanks!

[1/1] leds: trigger: input-events: Rewrite to fix a serious locking issue
      commit: 284ad8e7d5eeb1659b63f44fd094373900322de6

--
Lee Jones [李琼斯]


