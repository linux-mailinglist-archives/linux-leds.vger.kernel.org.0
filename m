Return-Path: <linux-leds+bounces-2391-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D83A3947CA6
	for <lists+linux-leds@lfdr.de>; Mon,  5 Aug 2024 16:16:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93CF1283A78
	for <lists+linux-leds@lfdr.de>; Mon,  5 Aug 2024 14:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A24E47F4A;
	Mon,  5 Aug 2024 14:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Opqjjt/E"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422142A1CA;
	Mon,  5 Aug 2024 14:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722867362; cv=none; b=vGFVbmzcCgavZE86Sv5K3RBiU98OJAhgUwjc3rHYuh0yLrf2mzGo2OrhfJ0k6wlhlPoDQgWKSBhWPVkRc+YeAdWCvBlx2wESc63fhYgchlzg1yXEKfkUvgm+dEp1Kr7P4HeRVZlQSWdYR47ANWhSbZFxR89b76E44fQkYv7CyhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722867362; c=relaxed/simple;
	bh=eYVose4rHjsszlhRfVJ9r98ZAX1PFn679ftInAZrD1o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NNrXa3aPi7hFv9A9DDVwttluzkNNWKgVybj6spCTYIuqjpS/FMorl43dRMwokSZgSnbAax7/RKJJvc3/vxI80vya4sUpM7giKVkrztkKbaKoTu9ly361RcLJjctGyMnGhchXFVkyGCPjE/ROX1IhiupCFwfLDZQ/pJrIEYt8fi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Opqjjt/E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D378C32782;
	Mon,  5 Aug 2024 14:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722867361;
	bh=eYVose4rHjsszlhRfVJ9r98ZAX1PFn679ftInAZrD1o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Opqjjt/ENJfWuCT3h2PC05FC3kIKhxMv9eT2TPlYzop1Yv76uYsvSjpi2EAxQLxHD
	 gpzCL4njxzn8HrPsFRzO0Xsek949C8ynIFtVvqUdp0YHtAtgNZMakCGgFR9zppl9Gh
	 cYfmyaohX4GT4jtdv56gCXNJHbZggDEQiAtCL1x7LjjppqxnJyPZCX20hu4/TT0R+T
	 PMlwDifUDmc3Spqh/bL0tLtVETKzZu2/bwrhvAg1oN8rUhb/Yf2C1sRdWSXRkOfArw
	 kZbTEPAWjiFxgYQDiC5dCuxXM0sBAej1qDuTEJzh0e2G5wZk3LAgrrc9XBejvsLfpi
	 sy1+DPwvqSXbQ==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Jack Chen <zenghuchen@google.com>
Cc: Mark Brown <broonie@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>, 
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org
In-Reply-To: <20240801153048.3813581-1-zenghuchen@google.com>
References: <20240801153048.3813581-1-zenghuchen@google.com>
Subject: Re: (subset) [PATCH v2] leds: lm3601x: Reset led controller during
 init
Message-Id: <172286735998.2344149.3683384497307166699.b4-ty@kernel.org>
Date: Mon, 05 Aug 2024 15:15:59 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 01 Aug 2024 11:30:48 -0400, Jack Chen wrote:
> LED controller should be reset during initialization to avoid abnormal
> behaviors. For example, when power to SoC is recycled but power to LED
> controller is not, LED controller should not presume to be in original
> state.
> 
> 

Applied, thanks!

[1/1] leds: lm3601x: Reset led controller during init
      commit: 70a4375e07fcbb771809f0af8b5f0df029ca660f

--
Lee Jones [李琼斯]


