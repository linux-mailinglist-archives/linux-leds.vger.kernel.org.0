Return-Path: <linux-leds+bounces-1670-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B648C4161
	for <lists+linux-leds@lfdr.de>; Mon, 13 May 2024 15:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 007841C22C7B
	for <lists+linux-leds@lfdr.de>; Mon, 13 May 2024 13:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F29E152164;
	Mon, 13 May 2024 13:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="rCKM86jd"
X-Original-To: linux-leds@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7631514C1;
	Mon, 13 May 2024 13:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715605602; cv=none; b=sDdNfsRiDwHxWSkFYciE8Sh5sxfwe+fOrpMe/KCsmIHN9+GeHQpm75WuYRyh0Y4ZuezWdV/7AxoXEJh16+DSn5s4t9wha+qp2Q8QDFJ4d2j9Ps/G3oo4L+OoAw4S+qB+d6ssTfdUY9stctZi9WvRTArXcddPUEYL0b/m7dKAJIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715605602; c=relaxed/simple;
	bh=PwpEC1pK3iSkqw+CUTBIysDmEzi1NrNuBuYMQbLR1QA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E6LyrN7qWLoDs6J/YqBj/uJBK+/S8Q5waQMQHoVcmacktqA54qX4sQJMNVY9ZsNCEPKYa1osSAJH3AH5ytWpTJMZ4CZ8yysOAMX+Hp7SwaXsk1Bhjz/lHoMXLcnYNd7lUDPrr5B5Er+HlJOTTzkXZUtsODmGgllFf6PDTfLHxEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=rCKM86jd; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715605598;
	bh=PwpEC1pK3iSkqw+CUTBIysDmEzi1NrNuBuYMQbLR1QA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rCKM86jdnNzFNN0ZUZ8E7eyk85EtZ5u7XrKBA7CCGs6T6jwEfTPstTgmjidxcDNmy
	 DWB91bI686mgao6PL9WvTDeR8YnmEwpuLEoVBhDPBce2ue6hGUBpcog1VHVseGOQLG
	 5+4DJzStCqRLCBriuWPRcv8MQv+z7W5KOcUmV4zxH8dnHEOO5tGbYNZcKyBx1kM70x
	 QodtRT3zS3RbF9Q5vR0sNbuMpF9bS99lwDH9yij19wEM/dqLt8hcciqRveiW1CJxNs
	 cpNSfF6jRUyVdWVvcMpoje/bAEGj4DMSku+Dz0bMqzha65lsQVF2c26BofluEZqhn2
	 1Ka8V2pMGCDAA==
Received: from [IPV6:fd00::2a:39ce] (cola.collaboradmins.com [IPv6:2a01:4f8:1c1c:5717::1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 39BB23782167;
	Mon, 13 May 2024 13:06:36 +0000 (UTC)
Message-ID: <a91e7353-7d09-43bd-ad4e-b5bdf15a6a9b@collabora.com>
Date: Mon, 13 May 2024 15:06:34 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: mediatek: Add mt7986 based Bananapi R3
 Mini
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Eric Woudstra <ericwouds@gmail.com>, Tianling Shen <cnsztl@immortalwrt.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Tianling Shen <cnsztl@gmail.com>,
 Daniel Golle <daniel@makrotopia.org>
References: <20240510095707.6895-1-linux@fw-web.de>
 <20240510095707.6895-3-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240510095707.6895-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 10/05/24 11:57, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add devicetree for Bananapi R3 Mini SBC.
> 
> Key features:
> - MediaTek MT7986A(Filogic 830) Quad core ARM Cortex A53
> - Wifi 6 2.4G/5G (MT7976C)
> - 2G DDR RAM
> - 8G eMMC flash
> - 128MB Nand flash
> - 2x 2.5GbE network port
> - 1x M.2 Key B USB interface
> - 1x M.2 KEY M PCIe interface
> - 1x USB2.0 interface
> 
> source: https://wiki.banana-pi.org/Banana_Pi_BPI-R3_Mini
> 
> Co-developed-by: Eric Woudstra <ericwouds@gmail.com>
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> Co-developed-by: Tianling Shen <cnsztl@gmail.com>
> Signed-off-by: Tianling Shen <cnsztl@gmail.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



