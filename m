Return-Path: <linux-leds+bounces-6253-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B4299C7489F
	for <lists+linux-leds@lfdr.de>; Thu, 20 Nov 2025 15:26:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3799B34EAD6
	for <lists+linux-leds@lfdr.de>; Thu, 20 Nov 2025 14:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C322E314B74;
	Thu, 20 Nov 2025 14:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bd4Mw0h+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A262D2398;
	Thu, 20 Nov 2025 14:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763648753; cv=none; b=uPfjXW/97XMzMG8PHfHbRyP70Pd5OJ/PeRL7CZeXwAqUhrylswzyAuyJ37Eh+f+a+saopJ+SsOwV/YFilTBElvoMAP4wUQj2Zu96i4fr+kgp1wP7+9DywTxr+uvILYfNZPMeRpUmo6vntk47UOitZKOSBxJFjv5n9f0NzuJOkM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763648753; c=relaxed/simple;
	bh=rkpdfQeJnF5xXUrRNegX96ZHruiuEjB4cpyr1lJ0P6Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cQwAs/uGY+hmkQmKfC6pzv1JaysQcCVejLFsR+R2pXasWaW7TdvyBnt1XM9yWKIQsUksOxhYQFxZUHEwjhjAYKoSHQSDvnIa68cpZyKapaoa7GJeo9NaXScjE/jTsKwUOIkJTE107gd1U1nWSyiylIMZY5MgiFJqtLyXqZd/hWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bd4Mw0h+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE7DC4CEF1;
	Thu, 20 Nov 2025 14:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763648753;
	bh=rkpdfQeJnF5xXUrRNegX96ZHruiuEjB4cpyr1lJ0P6Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Bd4Mw0h+63dwUEyPbvMxPumPVxsREix3mPyHjRoBV2hg9PBTvXmVw9eusyD4QH586
	 jFSugKTDS2YkzhdAAXlayd+AIcPKGZ9rsYHYn0sG2ayl/MMJqZoeaUMQEqDtCxgORj
	 xSq2M4uuduZy03xKWWMjiu6TUKfe0IYqa+gKtpMu92m3jhERdUimk2qbqM++S8oflo
	 OrGy4YKVbnukSMCM60WIkMnWbfYYYXKbJAYVxdlQ0iCc6naruqOzAnXhkFEpOFZSH3
	 AsdnZ9TLJlwxoTY06bI6vGYhoIzngSWXpgjxWX1NL0Wt22fmq+wYp5gt7QRVFPRz1A
	 XOYUoxn4jFa4g==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251117-topic-lpg_multi-v1-1-05604374a2dd@oss.qualcomm.com>
References: <20251117-topic-lpg_multi-v1-1-05604374a2dd@oss.qualcomm.com>
Subject: Re: (subset) [PATCH] leds: rgb: leds-qcom-lpg: Allow
 LED_COLOR_ID_MULTI
Message-Id: <176364875132.730551.13976525057976133763.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 14:25:51 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Mon, 17 Nov 2025 14:45:59 +0100, Konrad Dybcio wrote:
> There's nothing special about RGB multi-led instances. Allow any color
> combinations by simply extending the "if _RGB" checks.
> 
> 

Applied, thanks!

[1/1] leds: rgb: leds-qcom-lpg: Allow LED_COLOR_ID_MULTI
      commit: fc6a6da64fd847c3122848c5a0850daaeb0874e5

--
Lee Jones [李琼斯]


