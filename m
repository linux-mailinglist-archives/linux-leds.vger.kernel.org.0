Return-Path: <linux-leds+bounces-1759-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4438D6344
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 15:42:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39D9CB24FB9
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 13:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 324BD158DBA;
	Fri, 31 May 2024 13:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fIkUYd0N"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04740158DB2;
	Fri, 31 May 2024 13:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717162941; cv=none; b=vELitDPeDCmJmzl5y91ohhUZtNwOD9E/mSZGm+ZyuEv/BXXdUH+DQmIrlY1jyZhSCNE0tXiOL8TokoRWQDJzwSvd0CouMjknb4u6O/sYOpZIbcA2S7NrECFqwrtJFSzv9XODMSWl53VSuKL3OciXf2YWnpBSLMEn7eHfijeJJ/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717162941; c=relaxed/simple;
	bh=b9S2xdTagJqtJy7lo3gX33GfXgvExyw7AL6CaLo9qxM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gB6V2/C+sWH/nRB6IS4r0dNP0Dpp4z/C67CwfjBBO+zy647D8yJiEXWLMzwNwSztPSirgCx8RiDiGZrrKrxZch+ue8Uv5rd9+3wQngWDPRqkyR4rkTDTEQ3L8r62OslJ+wfFF2IlmHP86cAeILRZrjyshBR4J3W+NkG/HVDhQIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fIkUYd0N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F7D8C116B1;
	Fri, 31 May 2024 13:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717162940;
	bh=b9S2xdTagJqtJy7lo3gX33GfXgvExyw7AL6CaLo9qxM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fIkUYd0NkEchhhPswrxENPywvVfCYZRbdDaJdm8znojYGgOkUzcoVaR6nG3npzVdq
	 xJAVDK2vXDV631Zlf8zVT5QavUHykjVN0FQIlHeIAwlmESHS10dx2OQKrY3QWnvLpM
	 PrwZd85lGo+aowSz79UGFpc9ojpWVS7twWW704REP1uinAIv0x4i2qDkifBD7gCkr+
	 9tlOM/ACeTM2adJMV8fMpD0SfXLQ5Nnov9+wbfwRvz1u3o7uaUGq2vssoiLj7MbxJp
	 RKHm5nac2jUsqApaheh3Yb3ctKuVyrlprVMkwTxe4ZHsfkU82oHavuZztcP0bqD6/8
	 BpFUDVx4gokpQ==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <20240517-md-leds-bcm63138-v1-1-247b7302edb6@quicinc.com>
References: <20240517-md-leds-bcm63138-v1-1-247b7302edb6@quicinc.com>
Subject: Re: (subset) [PATCH] leds: bcm63138: add MODULE_DESCRIPTION()
Message-Id: <171716293807.1100598.8552000581890950344.b4-ty@kernel.org>
Date: Fri, 31 May 2024 14:42:18 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4

On Fri, 17 May 2024 12:30:11 -0700, Jeff Johnson wrote:
> Fix the 'make W=1" issue:
> 
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/blink/leds-bcm63138.o
> 
> 

Applied, thanks!

[1/1] leds: bcm63138: add MODULE_DESCRIPTION()
      commit: 819bddcd196b1c5df6aa78b1c28ec7f0cccce5e3

--
Lee Jones [李琼斯]


