Return-Path: <linux-leds+bounces-6603-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1568DD0AFE5
	for <lists+linux-leds@lfdr.de>; Fri, 09 Jan 2026 16:43:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF4ED309ADD2
	for <lists+linux-leds@lfdr.de>; Fri,  9 Jan 2026 15:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6035A3446A5;
	Fri,  9 Jan 2026 15:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZasKm+1N"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A28E33BBDD;
	Fri,  9 Jan 2026 15:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767973050; cv=none; b=OM11JPw3Sq8WMJ4Nf3ilLXpsjh2IcmKHn9cGFE6WHlCg1RSKQCXlX3W8ZowUg8IQztVQgu3zbLTKRaZfnPKHDQWDYg2Isjjip8ATNNnmiM/BESnoUINhxoVUq86nmGUH/6KAyn8/zNkWl9iDgJDy7d1Zabmod7xvm+3ipH0rALQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767973050; c=relaxed/simple;
	bh=ACUNN6uf/Mzk7nW4hB0vFtjfZE9QKznUScf7zaQyMnA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qIXoRnP9wrgOFovrbDWKOg6lxab5HRwqdLUEC2Kl10FfGInJM3sFzPR+ohLxZzns0JHFZ6VJqMLcMZJFGs/B9c3Hc8EmVlEKQ4MZXJZX+Ch9LW1i64EtvugTJWkywy2db6+tBb7chM9ZpCLWxUlmmc5mlW98L5llrMg0zI5eVNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZasKm+1N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A8FC4CEF1;
	Fri,  9 Jan 2026 15:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767973049;
	bh=ACUNN6uf/Mzk7nW4hB0vFtjfZE9QKznUScf7zaQyMnA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZasKm+1NhYuvZ1vRvxpurvjDbFRGSYfnxEdG54ByjI4hzCmxPPJmA7Ls8O1FimI2F
	 OadDfsDpwEtVRjg/ZB42ZEr0ze90erqFYVzvgp8JRN7PWIhM+mn54ka+Rj7npSUkVK
	 Fy6WBKMWUJ6WwgwN4FyIZYojE/q99fnMQr9dKiE/+TK3jVBX4TqrlMeGO5UNgyDwt9
	 EetfVPIdgOmmBujWk4+0c4OspT4+7ithuTJG/PmhfJUn18lXGAFGdyBvTEG53zkRCM
	 47aKm3LK4OmmBGTOc7R58VhZQc6T+Bdv7SkAT1HijLDrFQgABd5Gk3BMq+2+ceN14+
	 gF6NtxYPbw3Vw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, Nam Tran <trannamatk@gmail.com>
Cc: pavel@kernel.org, gregkh@linuxfoundation.org, rdunlap@infradead.org, 
 christophe.jaillet@wanadoo.fr, krzk+dt@kernel.org, robh@kernel.org, 
 conor+dt@kernel.org, corbet@lwn.net, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org
In-Reply-To: <20251221041950.4631-1-trannamatk@gmail.com>
References: <20251221041950.4631-1-trannamatk@gmail.com>
Subject: Re: [PATCH v20 0/3] leds: add new LED driver for TI LP5812
Message-Id: <176797304674.1816796.15103209205297232421.b4-ty@kernel.org>
Date: Fri, 09 Jan 2026 15:37:26 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Sun, 21 Dec 2025 11:19:47 +0700, Nam Tran wrote:
> This patch series adds initial support for the TI LP5812,
> a 4x3 matrix RGB LED driver with autonomous engine control.
> This version provides a minimal, clean implementation focused
> on core functionality only. The goal is to upstream a solid
> foundation, with the expectation that additional features can
> be added incrementally in future patches.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
      commit: 4f93556778d84c0bf25102bac1daf232368aa4eb
[2/3] leds: add basic support for TI/National Semiconductor LP5812 LED Driver
      (no commit info)
[3/3] docs: leds: Document TI LP5812 LED driver
      (no commit info)

--
Lee Jones [李琼斯]


