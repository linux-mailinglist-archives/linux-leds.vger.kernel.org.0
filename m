Return-Path: <linux-leds+bounces-1816-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3178D7CCC
	for <lists+linux-leds@lfdr.de>; Mon,  3 Jun 2024 09:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 897E028169C
	for <lists+linux-leds@lfdr.de>; Mon,  3 Jun 2024 07:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3F44D5AB;
	Mon,  3 Jun 2024 07:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="5LVGfTIv"
X-Original-To: linux-leds@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABAE3BB24;
	Mon,  3 Jun 2024 07:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717401115; cv=none; b=B8O7EiiuJU7+x+Doe2/m155QgiDQp8+Ol3Yl9/1kmkWPAXsL+TZgZSJKR4EKa/CVePnjR/AKyMnrJSJajlCyCxwvNNbFhdoQWD12txIxos8adiTIrD5Y4bgXs0J5UzZqqWarAM4OwXwfws6zFrYG4tnOYAAyLQbm3fc5j5zyLaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717401115; c=relaxed/simple;
	bh=UNGmFlIjG+IUgjY9/2P+gSGtwZOytRdfZTK8275Gdt0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=blRnEqD91BOe66/Yf49snpNvb4fGhI17hssMMZPEXfE/35dAzcaWdXTzmYBaeX95Z+ikea8EEohCB4pWla2x5jYs/6aAz/XD3SxvzMJyLLL/G7hBFbN4msuj8ygbO7wvXUfk284RRaaFMWhOUgizFwB0VnObH+qMV4nPsAP5uLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=5LVGfTIv; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717401112;
	bh=UNGmFlIjG+IUgjY9/2P+gSGtwZOytRdfZTK8275Gdt0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=5LVGfTIv30xTmxae/jtC/qEtIh1xKmHlQBqe+vE/2u5F+lO+oiMSnk9o7iZwexD9n
	 x7I5TgBu5DEdJsje+vsAW4KERyBP+ko81aLax8XC/1VXYf7wdNRcBu1mDm9GZDStV7
	 IM3+VuHGhNC1i/bX7Ldz7FfDG65LBOQ/Y13cy9Du6Uu3vDdRwVLIejTL0LWhBFJtxa
	 TSzDZ0zwkTm6R3X+mN1MqVxXiGB/U7J5iuBnuZ5gN5S3CvZM+8rmD1C80GP9ffuEkK
	 +Uwk6c0PSCtuDmlNaVc6FNgwkfR2N5dPAaSX8Qk65vgSjBvxluJh5yp8lR0rPk62eZ
	 HpDkTqC0yXMTQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0FE7537813CA;
	Mon,  3 Jun 2024 07:51:51 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
 Lee Jones <lee@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Frank Wunderlich <linux@fw-web.de>
Cc: Frank Wunderlich <frank-w@public-files.de>, 
 Eric Woudstra <ericwouds@gmail.com>, Tianling Shen <cnsztl@immortalwrt.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20240510095707.6895-1-linux@fw-web.de>
References: <20240510095707.6895-1-linux@fw-web.de>
Subject: Re: [PATCH v3 0/2] Add Bananapi R3 Mini
Message-Id: <171740111097.46559.14241820863717418080.b4-ty@collabora.com>
Date: Mon, 03 Jun 2024 09:51:50 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 10 May 2024 11:57:05 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add mt7986 based BananaPi R3 Mini SBC.
> 
> changes in v3:
> - fixed unicde parenthesis in commit description of dts patch
> - dropped "dts:" from title of binding patch
> - added AB to binding and RB to dts patch
> 
> [...]

Applied to v6.10-next/dts64, thanks!

[1/2] dt-bindings: arm64: mediatek: add BananaPi R3 Mini
      commit: ca33f36216abe52eef8e660c638d8200e72251e9
[2/2] arm64: dts: mediatek: Add mt7986 based Bananapi R3 Mini
      commit: 07d7e57ea9d9491075820d447f140de9b6c3bd40

Cheers,
Angelo



