Return-Path: <linux-leds+bounces-4458-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 707B9A85733
	for <lists+linux-leds@lfdr.de>; Fri, 11 Apr 2025 11:01:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D44D1BA371C
	for <lists+linux-leds@lfdr.de>; Fri, 11 Apr 2025 09:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BE5298983;
	Fri, 11 Apr 2025 09:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rBwIZNop"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5522980DF;
	Fri, 11 Apr 2025 09:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362101; cv=none; b=ob9K4GK2/0O2wT9LFNS+rAU4Jmal+CEUAnQlqp3A4ybBVVkVmLaxB2DWV4jEd1FbhOKYIS8oEpPSWUv1ub8w1V2US4WZTgHZa/foBf2GryyghB14oZ7icUo3tngezn5OLZ2O/hO7VaGPu4+XDmkyL82A3s2PMPMT0H0eIGjb7Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362101; c=relaxed/simple;
	bh=C8WRrehvFxOy56Znw0l8VZJoxOKVE0NyfCg5AVvsocg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nRI6grfsKaYvQB249Nqrlogzlfge8EhA+ddMyo9nKWzq8nvxeoWS0iDkfDxoVHHP7LyXqc7dCy59UuePG/GN2Y3Bz4WKSLt2g3WSOyrvrwhbiBHvvs7D76duW7mmPTd87Y9Yr5W5Xcn5o4qri8X5fp5MxMmhwtqaPtpM1Q7BjQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rBwIZNop; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A24FC4CEE2;
	Fri, 11 Apr 2025 09:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744362100;
	bh=C8WRrehvFxOy56Znw0l8VZJoxOKVE0NyfCg5AVvsocg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rBwIZNopcMhGjgjpHTP8g8YGFD+PPKXklhfrp9goyeTwB2B3BYk6m+CZeBWFvkdMV
	 VZXxC4OzOnymFqhOMykau39d6j2y4fM14Lm7Zf224CC/kaTmeXjlZQt35xMJ1/4w0H
	 zd6LQ9z7y1KYX8arUxcWyRB/RL7HPlWfwPytnBcjlrPkGMLx+Y01flJmXvAnAPt7Ww
	 W19LZnxCmOp3IA578Xk69h0OYTnfAMJ1H0jSlt55Rt1nB8Pp/jFzBP8UG/M76dG9Fv
	 9yK9u9i7rvX3XDkVit4S2y70AvNVxnjr0Rv1npccGGPaUo2WaAJdSOj6cQZFMJbWPq
	 2LhJBIfYMb17A==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Davis <afd@ti.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250407183555.409687-1-afd@ti.com>
References: <20250407183555.409687-1-afd@ti.com>
Subject: Re: [PATCH 1/6] leds: lp8860: Use regmap_multi_reg_write for
 EEPROM writes
Message-Id: <174436209877.2243005.12744981743232234297.b4-ty@kernel.org>
Date: Fri, 11 Apr 2025 10:01:38 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Mon, 07 Apr 2025 13:35:50 -0500, Andrew Davis wrote:
> This helper does the same thing as manual looping, use it instead.
> 
> 

Applied, thanks!

[1/6] leds: lp8860: Use regmap_multi_reg_write for EEPROM writes
      commit: 868242c7dca3b5625e08b9e682ed56aa63e74e29
[2/6] leds: lp8860: Use new mutex guards to cleanup function exits
      commit: c20b0f27b352e9d26b12f16e7214f397e7ef1cd1
[3/6] leds: lp8860: Remove default regs when not caching
      commit: f4a9dd5a9a67d813b89ca4ccfdd61f7a3aaf5afa
[4/6] leds: lp8860: Enable regulator using enable_optional helper
      commit: fa604baf13ced084636afbfa8d93f030ad8b593c
[5/6] leds: lp8860: Only unlock in lp8860_unlock_eeprom()
      commit: 16df093d79e43babdb8a35f66291f382402a414b
[6/6] leds: lp8860: Disable GPIO with devm action
      commit: e9bde6230972ad76fc91279850edd8dbc6f1cb4d

--
Lee Jones [李琼斯]


