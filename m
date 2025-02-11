Return-Path: <linux-leds+bounces-3924-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB450A30D27
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 14:41:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5948A160FEA
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 13:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A36922DFA1;
	Tue, 11 Feb 2025 13:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJUq8fDQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42482214811;
	Tue, 11 Feb 2025 13:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739281271; cv=none; b=l/j/ysXRx3uIMKmU8yvf6PlXdOoG1a+XlSdk2JJlpEzMqrVYmvPMBfp0/lfOPJ5wxd4Sc9beEPJ3nmHz6d02x+VL6IQ/vdSv9XOcTYh0XLs6sP80VKtiiVVPxTC/UWLVfmyuKYUcgNcsywfpXfv2+ViB1ufuPqdJsFQY9MsYzZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739281271; c=relaxed/simple;
	bh=p457+fNBKTBE67/aIJf/FVVxBqrNLH953ZGNpYT5xMs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Z8OMf8cHEdtPjYqYT70+635EVpL3sHCofUhK9iILeKHZRmTpqdKA6vrHYSh/hExsQlfinCG+8WpYNA3N7mAzZodmqed4a0kAM7OnLwy+1kNZit4jbQoy0xGB80Z3jD1ugVO7cTZR0ixU/7Rb+aNpE0+ArbwMzLkv+y/l47fclQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJUq8fDQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76022C4CEDD;
	Tue, 11 Feb 2025 13:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739281270;
	bh=p457+fNBKTBE67/aIJf/FVVxBqrNLH953ZGNpYT5xMs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cJUq8fDQmcDIKRoPRcv27h7IBpUY5OoEGV9JnZLzSpPOK6uV/rshAXOA/hHr10P99
	 2AXFPxIdtkyhlgfrYHjbCcwusNwALKgotu1EWXxmPVGg6ElcO7hxEirD6Q1dGaSCyD
	 tgqHuKwcGPe+hGt3HBMBufcQpX2ovgZhib5HLC6k6RlTUsUKjdwt1DigN7B9hV1f7w
	 0e+ffH4Qjcr4iN4fyFHcOhnfWXP8Ast8a96GkE+HwHsciMuhHBmr48Rfp0paiUXLsX
	 wI5oWjOnAqbZ/qvMYQMaFhL0DSizfmtJ7res37xwxyGyEyrBujJp24VRS3mRl4LhmA
	 rgM3Ab7P2Gr5Q==
From: Lee Jones <lee@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Lee Jones <lee@kernel.org>, 
 Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20250204-must_check-devm_mutex_init-v2-1-7b6271c4b7e6@weissschuh.net>
References: <20250204-must_check-devm_mutex_init-v2-0-7b6271c4b7e6@weissschuh.net>
 <20250204-must_check-devm_mutex_init-v2-1-7b6271c4b7e6@weissschuh.net>
Subject: Re: (subset) [PATCH v2 1/2] leds: st1202: Check for error code
 from devm_mutex_init() call
Message-Id: <173928126822.2162909.15560673798302833200.b4-ty@kernel.org>
Date: Tue, 11 Feb 2025 13:41:08 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Tue, 04 Feb 2025 07:52:50 +0100, Thomas Weißschuh wrote:
> Even if it's not critical, the avoidance of checking the error code
> from devm_mutex_init() call today diminishes the point of using devm
> variant of it. Tomorrow it may even leak something. Add the missed
> check.
> 
> 

Applied, thanks!

[1/2] leds: st1202: Check for error code from devm_mutex_init() call
      commit: 8168906bbb3ba678583422de29e6349407a94bb5

--
Lee Jones [李琼斯]


