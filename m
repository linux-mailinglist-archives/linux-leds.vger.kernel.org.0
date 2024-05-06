Return-Path: <linux-leds+bounces-1606-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7448BCE61
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2024 14:49:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A829D1F22E43
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2024 12:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939716CDD0;
	Mon,  6 May 2024 12:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="agYswDgv"
X-Original-To: linux-leds@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58F943687;
	Mon,  6 May 2024 12:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714999744; cv=none; b=BCd3GvBrBmQQOf4DqyNu/qDliSMyutDi5D0SXVlIwTCrZNLXszI9rufSWNurbbodTwgSxMbkBdJ/D83/LodyqvC2SKjPjPtfb+2gdoyPXTq12uv9Krs3NBPZ9R62jYUsn5P0gKmA1xsUs89goHCT3mzxjEAeBSkguGEA3NSVF24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714999744; c=relaxed/simple;
	bh=Qzp0VDoNytX9UV80RHFas/Xph5A4N+2BH6per0kfMpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C0pt4XtOfIhk7388dDzT2SzROhZc3zeTdXW9MqtaQeLxCyQE61rBmZeIQc387hECeV5w0R3rRaNO1n/5YDd9f9GFPcqEbbgCFzC/oPzoruU8BvzrsTz/tsXkxTAuba5H0REmySP632pkv7BqtZSUYt4HAEq+EVN8CCTIG1L5P1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=agYswDgv; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714999740;
	bh=Qzp0VDoNytX9UV80RHFas/Xph5A4N+2BH6per0kfMpg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=agYswDgv8RoUcmBs2PASjM+v5Rx8nS1ta5opi768m2wTivO2nPRv17vTk47pMUvjA
	 KELQlb90kf7IC8eWBXfs2kdjgpdUnCDndNijDh5qdDkTw0oaOullDWdEFH8HUaDGpO
	 as15Fyfh8txwshR9s07UpKvAbyaessixLCeX5C8P+s8wVBE7vCB7PBqpMVZKMQZcuI
	 5qX0oKvbd1iJD+4kjzn8bsT9voSy3h/PhOEWMOdi608DyAJ60e4gkd00ek60IkIxUq
	 SAk/Y9BxbZjxMsn0UkD/+kBtUYEqQMT9pyDSI0euMhCujgleTky0c7yZV99eKzK2pw
	 Eho4FRIfGuH7g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 196AB37813E3;
	Mon,  6 May 2024 12:48:59 +0000 (UTC)
Message-ID: <a43a076f-7d7e-4c7d-8be1-45569c7b2c16@collabora.com>
Date: Mon, 6 May 2024 14:48:58 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 2/5] dt-bindings: clock: mediatek: add address-cells and
 size-cells to ethsys
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
 linux-mediatek@lists.infradead.org
References: <20240505164549.65644-1-linux@fw-web.de>
 <20240505164549.65644-3-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240505164549.65644-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 05/05/24 18:45, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add missing properties already used in mt7986a.dtsi.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Fixes tag? :-)

Cheers,
Angelo

