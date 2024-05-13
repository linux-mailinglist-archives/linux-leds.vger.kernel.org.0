Return-Path: <linux-leds+bounces-1669-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA208C415B
	for <lists+linux-leds@lfdr.de>; Mon, 13 May 2024 15:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B6F21C22D72
	for <lists+linux-leds@lfdr.de>; Mon, 13 May 2024 13:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4C7E15098E;
	Mon, 13 May 2024 13:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RH/1CAKa"
X-Original-To: linux-leds@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DB973502;
	Mon, 13 May 2024 13:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715605599; cv=none; b=LZTpOi11DtTUyTrNNt8BwOMNwr/O/YRZk0mnsw857i534c2+Q/zBocZueZk3MFMgK+2BdJcNZidTzZTU/1e+IJxUBL6Fq58QS1U7sJ6iNzJeu/dIJK7/WFCjsQDjaa+7vRic+Z47Yhb3rfZD9oyB82tL6O9weEi7Qin1sNTypzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715605599; c=relaxed/simple;
	bh=/Eyn9bkH5uoTKww4e9w5tijFhp5wmymIjSTpXFGepHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=egqj6+VPKlOIEWybHZKm5K7HBbw8pB/H9AiuFo2QLtTyLPqaw+DXHqh0aHXDsh/vq3j6RhRxawBoTjgMr0ZJvkiE4kJg9v3PpwYChzQvBjE9J75OCKCTg/b1paialwl3OowVY+rqY2UB1m5r/a36sfPIcf/9NEXb98HNiXlOtYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RH/1CAKa; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715605596;
	bh=/Eyn9bkH5uoTKww4e9w5tijFhp5wmymIjSTpXFGepHA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RH/1CAKa1enDROjodfX18vOgP9pZ7PFlTktwN5ISlQGt93tgVOI3O6SLI9OJqh46y
	 QsrPDKVwoyf9ZhqG3HEOTWaqO2KLDYrrmHLZnjyGbHoMUKR/NMtG+LzW1NZNNpSKVr
	 5DJl7o8Yruis5fCyVYZ4LicMK51zs2YpZAn+quzWarB31aXV5dqCSeGQm6kRUSXRiU
	 AwAVby/LufM0XWqtm4fr5EmVxWnYsuQ3C4M3M5+pz1G3s8QXhPccW+J65xTLvtoqW7
	 r/EHIqlF+nYjbhXu/ZcOFea9GeyiPVTkfeoBSavfbwMoPwNSA9dbgkn7LyrR9eruc6
	 kYD/jn0+NzIUg==
Received: from [IPV6:fd00::2a:39ce] (cola.collaboradmins.com [IPv6:2a01:4f8:1c1c:5717::1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 91EC53782139;
	Mon, 13 May 2024 13:06:33 +0000 (UTC)
Message-ID: <a7a20d35-f566-4c3c-aef1-cb7a0f349cf6@collabora.com>
Date: Mon, 13 May 2024 15:06:32 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: arm64: mediatek: add BananaPi R3 Mini
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
 linux-mediatek@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
References: <20240510095707.6895-1-linux@fw-web.de>
 <20240510095707.6895-2-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240510095707.6895-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 10/05/24 11:57, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add MT7988A based BananaPi R3 Mini.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



