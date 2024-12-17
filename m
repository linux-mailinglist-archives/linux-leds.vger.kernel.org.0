Return-Path: <linux-leds+bounces-3632-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4106A9F4ECC
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2024 16:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13B031894215
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2024 15:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27A51F37B4;
	Tue, 17 Dec 2024 15:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHJm1rxm"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9A0148850
	for <linux-leds@vger.kernel.org>; Tue, 17 Dec 2024 15:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734447696; cv=none; b=ePsBxbZboyPLLJZFWF5etVNfQ1rnL2FyV6VN6LztvuCninDGyh0vPd3xQwJ89NFi+Q21TDdmkPwkU1tArFDx5VGuuTrTGUOTm7v5aP+wAM5zCoTNYoE/H/xPf0+oNREYAXxpv0g6RufvfYvQkTxiPo8kFO0I+I7OFbSibLbL3eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734447696; c=relaxed/simple;
	bh=AfkwcGaK69Q4/l5zLPybzXVnUThkcmZEg5ojJJzsIXc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jhgX9uFZo/da2xNqK35kurPyS++x9vFmJO80y72ynDAXcgLpic7LixhVHCQckyi/gE7KAR7MX2fk+Jw907bsitEiiQ1NGP/yBc/wyL8PMyiIrJR/+SpI0l0AjOOAW6TgHC3trbUs7OKomGZAHgonspnfIFogt2p7CwZtpJDjU2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHJm1rxm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 555DDC4CED3;
	Tue, 17 Dec 2024 15:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734447696;
	bh=AfkwcGaK69Q4/l5zLPybzXVnUThkcmZEg5ojJJzsIXc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FHJm1rxmXyjx5oJ13VbbHBeIXA9F4/vB9z6iF9ur4KV1LyB+0xDviEVg9Fe6g7BOQ
	 TY+d6kBvVqVqqBQ2cII4r1BzxahGOh1y8StI/BhDkRDZmr96CnZ9E+vVpRFPsB03+h
	 7i3sRa7QpHaCGK0vo5W+JHaI4MYumTitD1xuYe4rLuLvqLUFImAJIseWzM7KMuxF/L
	 UPgw0+cFZKweaIjzwDhh9+loD8z7PZzcGeDAxfZO8YWucAgB3yQKRz7paSVvaxZ1zy
	 C68b7jbj5WObWvKlkiRFHHkv6liVGKejMt2503pTUtckYaAJ/zQPchvmCN4/xsi1j2
	 RXv6xV1qcNPdg==
From: Lee Jones <lee@kernel.org>
To: pavel@ucw.cz, lee@kernel.org, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: linux-leds@vger.kernel.org
In-Reply-To: <20241216074923.628509-1-joe@pf.is.s.u-tokyo.ac.jp>
References: <20241216074923.628509-1-joe@pf.is.s.u-tokyo.ac.jp>
Subject: Re: (subset) [PATCH] leds: netxbig: fix an OF node reference leak
 in netxbig_leds_get_of_pdata()
Message-Id: <173444769507.1872399.16713531370220293589.b4-ty@kernel.org>
Date: Tue, 17 Dec 2024 15:01:35 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Mon, 16 Dec 2024 16:49:23 +0900, Joe Hattori wrote:
> netxbig_leds_get_of_pdata() does not release the OF node obtained by
> of_parse_phandle() when of_find_device_by_node() fails. Add an
> of_node_put() call to fix the leak.
> 
> This bug was found by an experimental static analysis tool that I am
> developing.
> 
> [...]

Applied, thanks!

[1/1] leds: netxbig: fix an OF node reference leak in netxbig_leds_get_of_pdata()
      commit: 0508316be63bb735f59bdc8fe4527cadb62210ca

--
Lee Jones [李琼斯]


