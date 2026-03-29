Return-Path: <linux-leds+bounces-7556-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHJ4OXvCyGk7qQUAu9opvQ
	(envelope-from <linux-leds+bounces-7556-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 08:11:07 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 965B7350E46
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 08:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F870301F9ED
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 06:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21E429BD90;
	Sun, 29 Mar 2026 06:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="LBkcIay9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LLJMRPZ+"
X-Original-To: linux-leds@vger.kernel.org
Received: from flow-a2-smtp.messagingengine.com (flow-a2-smtp.messagingengine.com [103.168.172.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8322494F0;
	Sun, 29 Mar 2026 06:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774764661; cv=none; b=M5L4d1GNYI3/mfzf/vludHx+Gl8pox49Q/p602StWbxTeJHVTw9gwSmnymVyAbZAQO9t+MmyNorGd0mn9DD4Dk4zmtI+6QFeGh2CIX7IVzRHdwUGQbyoHigkveBtfgnmlf7A4aGbGd+UbCmnLIxu45SHu3gaR7i7yAA/a6IUPos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774764661; c=relaxed/simple;
	bh=MfmOLigdWE8bsU7XHgwedxVC8vvi1919XD9DgZjdwi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bTHCjNoajfLhIJGn+hq+xcywTFUu67J6TsF5VfXpgGysPqnNCEXGEeLJQdOrFOJjDc7c5MO57wDd44tf8RQ7i5SmGtVCO4CsdQMa/qyPo8c92pLqRTviZBdB5YV7l0vhUYP6AE8Mw7t68FRPUEnbdE+yp5RQouWAoAwD+bQ0y4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=LBkcIay9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LLJMRPZ+; arc=none smtp.client-ip=103.168.172.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id 7CB0013803E4;
	Sun, 29 Mar 2026 02:10:58 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 29 Mar 2026 02:10:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1774764658; x=1774771858; bh=Me/2NNLQWh
	li5jt5GB39ENZZ9ju/MKEHh68QaDIIrS0=; b=LBkcIay900en4TEqk60VRxH4gY
	rYv5r0SS8ewN7IvSN8OSajdMlpXaIjvKrdhRLaCECGUn5abbidHNaTx2lP4SfJk6
	js0XaYC7tTVAvmfBvXOxq32qjQmdA+mKayyis1J8bkSo9QysCRRp/OeatL5tH+pe
	rgSHbALLc3187vQkdVGd6ZS2h9oqSr2tmBU7bDfecpOdmuNFpViqHvtMZxXgEuQw
	st5kaBsF4FdIUIpKAIS7hHp/luQyaZtQplY9X10tKYqbvVySg66LnvqfyAfNkpVV
	aUEdjyf2woXlZF6ZiV8W8ilKktKyIj3VgzNOZzUZLa8LKhWj1cHwONXzzSZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774764658; x=1774771858; bh=Me/2NNLQWhli5jt5GB39ENZZ9ju/MKEHh68
	QaDIIrS0=; b=LLJMRPZ+yz+yNImgvl6SMQYDwauyGtQNR5Ym38EZGOowfCbUoZm
	6zvOJX627XnoqxEqRSjVnWr/ucTWm/E2nX7q+Dkf34FX2X1RTP9ZyeTeT+xqlIID
	dx1ZoHxAdPIvXUQtHVS5hvi4R6Jrv6eHfzqcS1cR4XOEbKTWwh9QsdkF2Zh5DYFF
	RWXkJG15ZF9Mi7MlTMiQ96laoJiWFuBsWas18+0dNMp5J0enMRySMftULzbzsN1d
	DzulrViTjLOXnrwjj45WCuv1OnYNLDPXCetflmq56MzCyn6dhhl+NsBxIfuycV/N
	ogChP+yQcTH3fVPu782Tr1nfeHsYMnUQMkA==
X-ME-Sender: <xms:ccLIae9ZIl-PvaFBq0ftyPIPtbJ0cJ7m88zg6b5itoOQtgm3qEwZhA>
    <xme:ccLIafgo3XsYuGWUPEovPJ26cSRyWG33R7Ee9yxBQsZ28pOK5tMNor1gpcO_wp31i
    iIpGUmcKeg4aWjqU4Jtk6O-m9PvOSBc0XGFy3Lqu1G-bHV5>
X-ME-Received: <xmr:ccLIaSmC4epcOvkxbkau1qRne3h-nypTIHtN6hg5m2ssPpComy99fYT9xaTtyPjECN19XO21XM8h-St0o-jFjzM4B7DrZGL31vSLVN0F3hk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffeehfedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepueegledvgf
    euffetffehfffgkeegtddtudejudeiiedvuedtteelleejvddtgfefnecuffhomhgrihhn
    pehmshhgihgurdhlihhnkhdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhmpdhn
    sggprhgtphhtthhopeegkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepnhgrth
    hhsggrphhprghisehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnuggvrhhsshhonhes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhonhhrrgguhigstghioheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodguth
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepphgrvhgvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgvrghnse
    hmvghsshdrohhrgh
X-ME-Proxy: <xmx:ccLIacRtSpq2hxfQN7N1HKjjGZs7UCoAiw_SCXb6QJGaH8iWm2CUIA>
    <xmx:ccLIaeW1M8ZW696sfK9rjzo_t_HBeXq9CGb65POQUfQmkO-wuL_t2Q>
    <xmx:ccLIaVshc5UWMaSgc98765Q-8rKO4s4jb5o7LAhgEF85m9Tki_jBmQ>
    <xmx:ccLIacslVZOv_OBX_RcxzbRY4KmR_etruzRz6-HXCGpY6ZaBSv-5KA>
    <xmx:csLIaRaBug03GqzpcrWhiNOAe6GeymvzonHKblRxaUznLYFQJQ70648i>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Mar 2026 02:10:56 -0400 (EDT)
Date: Sun, 29 Mar 2026 08:10:54 +0200
From: Greg KH <greg@kroah.com>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org, stable@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/7] Add vibrator, IR transmitter and USB-C handling
 in xiaomi-ginkgo
Message-ID: <2026032949-vice-ashen-e0c5@gregkh>
References: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kroah.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kroah.com:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7556-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[greg@kroah.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kroah.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kroah.com:dkim]
X-Rspamd-Queue-Id: 965B7350E46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 04:47:55AM +0000, Biswapriyo Nath wrote:
> This patch series add support for various components in Xiaomi Redmi
> Note 8.
> 
> Most notably:
> - IR transmitter
> - USB-C OTG
> - Vibrator
> 
> Also, fix some bindings warning as reported due to previous commits.
> These are tested with linux-next tag next-20260320.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
> Changes in v2:
> - Move bindings fixes to first in the series and add fixes tag.
> - Link to v1: https://patch.msgid.link/20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com
> 
> ---
> Biswapriyo Nath (7):
>       arm64: dts: qcom: sm6125: Use 64 bit addressing
>       dt-bindings: clock: qcom, dispcc-sm6125: Add #reset-cells property
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable vibrator
>       arm64: dts: qcom: sm6125: Enable USB-C port handling
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632 Type-C property
>       dt-bindings: leds: irled: ir-spi-led: Add new duty-cycle value
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR transmitter
> 
>  .../bindings/clock/qcom,dispcc-sm6125.yaml         |   3 +
>  .../devicetree/bindings/leds/irled/ir-spi-led.yaml |   2 +-
>  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi |  56 +++++++
>  arch/arm64/boot/dts/qcom/sm6125.dtsi               | 168 +++++++++++----------
>  4 files changed, 152 insertions(+), 77 deletions(-)
> ---
> base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
> change-id: 20260325-ginkgo-add-usb-ir-vib-4a51bd9ff64b
> 
> Best regards,
> --  
> Biswapriyo Nath <nathbappai@gmail.com>
> 
> 

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

