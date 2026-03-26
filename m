Return-Path: <linux-leds+bounces-7531-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GYJGwFzxWmN+QQAu9opvQ
	(envelope-from <linux-leds+bounces-7531-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 18:55:13 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3568B33991A
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 18:55:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 33F793046086
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 17:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628693914E1;
	Thu, 26 Mar 2026 17:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="GpG6sHai";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="tK5XT8gl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B352033065C;
	Thu, 26 Mar 2026 17:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774547293; cv=none; b=ciA8qeu6c3MIJijFt51bpuE9YcywpPE1f3eObTSbD3UU9pue4/7S3+DhNPxz9vBU0yor5ZfKEqXsEhK/K48L8k10ei01Q9xCt+YVBBepBmayXKFFfs238Mjr2h2P+5dMukZ9/XGk2BCdpLzTjBLx8EeDUs69Y6CHfG/9c3liCZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774547293; c=relaxed/simple;
	bh=DTxED/e7umhg7+GX+gtMUVo3085Rfcc7YrPrEZ1eBrY=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=KqBPJNWPojBL86pj8r+THr1a8nsuYjz8Ws2cYiVUzmR9HvwmiyQwsqLKPmGyGTTn2mZbn0kqx8aIdXGdym0nb2VvQvI0QX06h/lQmTu2+1ZXjMUdLB5xgC/sfihcDWsIQm91OJFyN5vrksfTxktZ7jTgmy+bXp2tHV1L4n8OA5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=GpG6sHai; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=tK5XT8gl; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1774547288; bh=TcWB/9vyD54+dFx1oHfTRCb
	cspoYc7ZfLbCigZuE7fk=; b=GpG6sHaiG6SrHUIZqGpMcGlN+QXG/SdMAfzkdH6/pWf+nliAVA
	cLkzBSCexOqjAeIc0JCvEEGOT6fwo/bzFzqb/6mAEnD3fNdR1+Yli2N2nZRAFYi07N/UgmyRon2
	J1CQxFRlQQXci3kmjpRqE0w2hRSPij6UTO9hLixe3CEm+ZSG5taeyZ+z1Mu0y2unYja3K/qjolo
	tg/E/TIN9nbwftq6GaMeW4v/JlYioN2Sx5jL8C8AZn+Gynvx77aArrUOmvm2ObE6hKPSEYcqTNR
	7HG0wk6YUztU12EKhJaLMAhJBw+M9v1RS1EBGfrgQCfV0aohuG/IaLH/ewazqFh/vpA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1774547288; bh=TcWB/9vyD54+dFx1oHfTRCb
	cspoYc7ZfLbCigZuE7fk=; b=tK5XT8glwGmZjOacZ4juSdcmsuTwgWoF619oyzb4P+0AKZnpwU
	/smzfuJcewTKfpLTMEGNC3srarWn3VfItKCw==;
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 26 Mar 2026 18:48:08 +0100
From: barnabas.czeman@mainlining.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Biswapriyo Nath <nathbappai@gmail.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek
 <pavel@kernel.org>, Sean Young <sean@mess.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Martin Botka
 <martin.botka@somainline.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-clk@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, kernel
 test robot <lkp@intel.com>
Subject: Re: [PATCH 0/7] Add vibrator, IR transmitter and USB-C handling in
 xiaomi-ginkgo
In-Reply-To: <9a61ad79-b787-4b83-b7dd-2ea36e7cea81@oss.qualcomm.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <9a61ad79-b787-4b83-b7dd-2ea36e7cea81@oss.qualcomm.com>
Message-ID: <cc0d9e1d8f85bf2b67df35b8d9c2110c@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7531-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,mess.org,baylibre.com,somainline.org,vger.kernel.org,lists.sr.ht,intel.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[mainlining.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3568B33991A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-26 10:39, Konrad Dybcio wrote:
> On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
>> This patch series add support for various components in Xiaomi Redmi
>> Note 8.
>> 
>> Most notably:
>> - IR transmitter
>> - USB-C OTG
>> - Vibrator
>> 
>> Also, fix some bindings warning as reported due to previous commits.
>> These are tested with linux-next tag next-20260320.
>> 
>> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
>> ---
>> Biswapriyo Nath (7):
>>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable vibrator
>>       arm64: dts: qcom: sm6125: Enable USB-C port handling
>>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632 Type-C 
>> property
>>       dt-bindings: leds: irled: ir-spi-led: Add new duty-cycle value
>>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR transmitter
>>       arm64: dts: qcom: sm6125: Use 64 bit addressing
>>       dt-bindings: clock: qcom, dispcc-sm6125: Add #reset-cells 
>> property
>> 
>>  .../bindings/clock/qcom,dispcc-sm6125.yaml         |   3 +
>>  .../devicetree/bindings/leds/irled/ir-spi-led.yaml |   2 +-
>>  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi |  56 +++++++
> 
> I'm assuming all of these changes apply to both ginkgo and willow,
> which both include ginkgo-common?
All these change should work on both, willow is a ginkgo with NFC.
> 
> Konrad

