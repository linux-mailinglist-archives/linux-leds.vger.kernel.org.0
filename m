Return-Path: <linux-leds+bounces-1757-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD2C8D633D
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 15:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A5FE28CA08
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 13:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38400158DAE;
	Fri, 31 May 2024 13:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BSdRRlEc"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F479158D8C;
	Fri, 31 May 2024 13:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717162875; cv=none; b=re6EgYkK7MTL5MqvMNfuQYptRjJ3LOSbV+Ma266dOawr73G7MsJ5BQTA5kZUZPxu8ZUaRaAzYpI6BMNI3Up2AV1hfMjYKa9fLMVPc/9oRDTw70NWp2bpx4eC5rNpObzyLL6b7Paz1hjqlTuJFE/8Rqy7G0/yQh74knLj0/K6MIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717162875; c=relaxed/simple;
	bh=Yoj8L34XzLixGmJmFUAlupo3t9Ynd7EgYk9zxBow8U8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p5GJ1fB+zF5qRcgf9aHkLfPCM97RUQXXol2fserUi1b14Z0zP1cK6cOfoZ5/ESiD8awFHq7grdsoqHV/GngiDC/GFew6zuY3EXcQYIuzuS3c5KKDMzbSTaPJWZprsJUQGxi8cuSFXDno355x1Xjlg5z+C7mgdPZABj314sfG46w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BSdRRlEc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C6AC116B1;
	Fri, 31 May 2024 13:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717162874;
	bh=Yoj8L34XzLixGmJmFUAlupo3t9Ynd7EgYk9zxBow8U8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BSdRRlEcX5HtGBIY3gljUR1RQ3sqaDxDZ7JytjSHcDCkOcM21OyT1+ysFe99ewDln
	 RnE0TaJEtmWIr68uxUJz+FZJz27qi3Nfwmq/oGPdYBwHJrAzA57xtWD9NL12oVpsyR
	 uy0cvezboQKRNDz0VDLTS7KI5MStbDLB8iB+ewsJA5GvyOdkO78Jg9BhgnXvSnz5N3
	 ICFpQqfpp93/J4h4z0gaYKzRVYotdtZyC1QH+9Pu55XWa8kGvSYQwV7FDFguxkEdRL
	 bu4ahMmnHnXBRj3MiDmTUFEzPyxr8Q20vEzEVaiHPt/fvApXq2CtPGP+N13fTUxahd
	 dpZCAxJA0aZ4A==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240517-md-leds-rt4505-v1-1-2f388ff6b672@quicinc.com>
References: <20240517-md-leds-rt4505-v1-1-2f388ff6b672@quicinc.com>
Subject: Re: (subset) [PATCH] leds: rt4505: add MODULE_DESCRIPTION()
Message-Id: <171716287234.1098752.783506122059597195.b4-ty@kernel.org>
Date: Fri, 31 May 2024 14:41:12 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4

On Fri, 17 May 2024 12:18:49 -0700, Jeff Johnson wrote:
> Fix the 'make W=1" issue:
> 
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/flash/leds-rt4505.o
> 
> 

Applied, thanks!

[1/1] leds: rt4505: add MODULE_DESCRIPTION()
      commit: c6c4c4ac239baab0fbc4ec62683ced34ce044ce6

--
Lee Jones [李琼斯]


