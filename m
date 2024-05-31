Return-Path: <linux-leds+bounces-1758-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F878D6340
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 15:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3F6B28F1C0
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 13:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDE0C158DB9;
	Fri, 31 May 2024 13:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gwTJNfFH"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1227158D69;
	Fri, 31 May 2024 13:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717162912; cv=none; b=kI9WZYX8BgA8CuslLuwGkD0HZWSXMLC/xj9UCzR8tYVPvXbpWf/0kPtRAz+Xv3d9JPmwmXepTobbYSXX+hPJCFytNy9fuvCXJSQ6YK674lttpmeS4jfiXiWet8WaRphI99lOLxTcvF0gVhwDWWRQzo5nyX5G94NgCglBsrV3DOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717162912; c=relaxed/simple;
	bh=Vp2KbDuLKKVnNB7kzomqZ0fbkXw6k3fEAd3Vv5s9tYc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CppWVjQPo3rq2xnEpaGH0UDb1NiRFFEAL8/IIfH2psGz1AYP+M/Irxm/tdOSWK4mhJ0RG4LrCKtg/P0fm3wIZQaTOJXr7NKR7zLT/sQufPyM6Kp5sdS0quFnuS2bPC0Vk7IvK1U67GSpaIS2c0fLf4bxhxIp4gIqfd24kmfhl/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gwTJNfFH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96267C116B1;
	Fri, 31 May 2024 13:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717162912;
	bh=Vp2KbDuLKKVnNB7kzomqZ0fbkXw6k3fEAd3Vv5s9tYc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gwTJNfFHI5bjLTJYZilqubv+4GhoEXbYMv4kWLWA2N2J9lsJXGxHhOay1gO/q++3S
	 MA2ZMdmoyatl9cPpPFsQuzn+eAYPk/kwSd29Lxvq2SQfz106Q4NLys/LGIK9axTGM3
	 oo43uOOtGr8eLKrYvpZoGTGCv9COUwBNLL3NUJScQssqVG0zgxKCvlU1cb4iNYBdVp
	 6jh8ZMh4akkA+4OuxqBtYkekLHGu5fOP0qtZKIfJZoMTyKQkaaDsKqtrIoKE3AXBjA
	 k+VdPxUWztut+TvGct8++8SlTGtaW/R8bvRRLiEPCT1N+O4GjKRo3BcuMKSIUkQ4TH
	 gkcQO3StLHuSA==
From: Lee Jones <lee@kernel.org>
To: Gerd Haeussler <gerd.haeussler.ext@siemens.com>, 
 Xing Tong Wu <xingtong.wu@siemens.com>, 
 Tobias Schaffner <tobias.schaffner@siemens.com>, 
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <20240517-md-simatic-ipc-v1-1-bbbd199262b8@quicinc.com>
References: <20240517-md-simatic-ipc-v1-1-bbbd199262b8@quicinc.com>
Subject: Re: (subset) [PATCH] leds: simatic-ipc-leds: add missing
 MODULE_DESCRIPTION() macros
Message-Id: <171716291034.1099950.15998690070000422832.b4-ty@kernel.org>
Date: Fri, 31 May 2024 14:41:50 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4

On Fri, 17 May 2024 12:53:27 -0700, Jeff Johnson wrote:
> Fix the 'make W=1' issues:
> 
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/simple/simatic-ipc-leds-gpio-apollolake.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/simple/simatic-ipc-leds-gpio-core.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/simple/simatic-ipc-leds-gpio-elkhartlake.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/simple/simatic-ipc-leds-gpio-f7188x.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/simple/simatic-ipc-leds.o
> 
> [...]

Applied, thanks!

[1/1] leds: simatic-ipc-leds: add missing MODULE_DESCRIPTION() macros
      commit: 81f32502c1cb4b850a01a1f108ae59f28f1c6155

--
Lee Jones [李琼斯]


