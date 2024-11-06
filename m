Return-Path: <linux-leds+bounces-3296-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E949BE003
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 09:12:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2DE21C22D30
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 08:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43F61D278B;
	Wed,  6 Nov 2024 08:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WemPlcW5"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AE81D0BA3;
	Wed,  6 Nov 2024 08:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730880720; cv=none; b=aMB0W1t8ch660iZX2zXvI5SuMLfdWo7qXvfCC4SbZq23PnoeGTis7FR7q+j7t3pVgNVl0mezFyrHcgovSD+25tROnhi/WB0jmYGLLsbA7SBe8GpD6DIGHZ86oRWaOhj+H0ZTIwEb1I7o28+IcHPJiDqocDMX6ToIZcqlNl7ylq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730880720; c=relaxed/simple;
	bh=WLeicapkpY2uqY6rdmYLNQTNvFaYtx7TwITC6mCx608=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EuXRuEAvwprmd9LbUSKMQ3qhMQNqUloVPPTWZjMcw2T7+3at0ZycNHg4nCLF5lY1LEublV3m5P4/IspgdoCrPcHTkHSUKFHj/SaPPUvSSY29YytTT9JuPoIetB5IIxos5UGbnzgYe7M8b9DobtSl14mZDIHOjPCBgIwcJDCt+cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WemPlcW5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83798C4CECD;
	Wed,  6 Nov 2024 08:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730880720;
	bh=WLeicapkpY2uqY6rdmYLNQTNvFaYtx7TwITC6mCx608=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WemPlcW51DXwG4TmHR+Psw03/h9CYFA+i2wT3F3NTPfa81woiNPF7DKrkVCrDuBzS
	 0PaY3ZX/Y2jjSRJu7FDe/75ob4NYAXKZcWMXQMeOSIgTSeZjB7UT0k7gGxu2HIIMH+
	 JAnnWm/mpFBe3skpmgwXakwdkcNAZR4pAgJo7yRQiUSlghYl2Q0WVQbMLqFPKoQuSA
	 ck5lNg/bLSPjmPGaj/babqFUVWAl7ev2pmczjO/6oWBqJyDoj+ZQq+Fj09GduAHeFy
	 6TXZswZkfnIWLPhkatrhMO0/LFYpj81cLiPtrQWg/WN8kZa8Hf2m6R0y405SLhScvJ
	 D5u8B3J3pBS8w==
From: Lee Jones <lee@kernel.org>
To: pavel@ucw.cz, lee@kernel.org, 
 Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 kernel@salutedevices.com, rockosov@gmail.com, 
 Alexey Romanov <avromanov@salutedevices.com>
In-Reply-To: <20240903223936.21292-1-ddrokosov@salutedevices.com>
References: <20240903223936.21292-1-ddrokosov@salutedevices.com>
Subject: Re: (subset) [PATCH v2] leds: introduce ordered workqueue for leds
 events instead of system_wq
Message-Id: <173088071827.3234293.7159770328606603865.b4-ty@kernel.org>
Date: Wed, 06 Nov 2024 08:11:58 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 04 Sep 2024 01:39:30 +0300, Dmitry Rokosov wrote:
> This allows to setup ordered workqueue for leds events. This may be
> useful, because default 'system_wq' does not guarantee execution order
> of each work_struct, thus for several brightness update requests (for
> multiple leds), real brightness switch could be in random order.
> 
> Yes, for sysfs-based leds we have flush_work() call inside
> brightness_store() operation, but it's blocking call, so userspace
> caller can be blocked at a long time, which means leds animation stream
> can be broken.
> 
> [...]

Applied, thanks!

[1/1] leds: introduce ordered workqueue for leds events instead of system_wq
      commit: 32360bf6a5d4016669c3545e7b0ec939937f5331

--
Lee Jones [李琼斯]


