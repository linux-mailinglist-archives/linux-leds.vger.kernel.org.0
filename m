Return-Path: <linux-leds+bounces-557-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8067B8282B0
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jan 2024 10:06:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 185DC1F236D9
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jan 2024 09:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3D225757;
	Tue,  9 Jan 2024 09:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="eAuXrmhw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="A34xMMKt"
X-Original-To: linux-leds@vger.kernel.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C212E846
	for <linux-leds@vger.kernel.org>; Tue,  9 Jan 2024 09:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 973B63200A33;
	Tue,  9 Jan 2024 04:06:17 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 09 Jan 2024 04:06:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1704791177; x=1704877577; bh=oCTtnOtrl0
	OtG4czG0X3shoz53TC150412PTq+VJGcE=; b=eAuXrmhwfYFmr5k98OLqE/wrJk
	Qj4/5TCLzNegYVG+eGcIjxOua17gxXltwCCtQE6m/zbEgkUlpx20uiQJZpX2qr18
	6Tn55yp7Tq4+0LhZyOEEhumHzTZ3Imb8AZsRrmJRgqe8eswF2IM6cbrLgKbS5mEg
	hf923/pPbvz80YGh9yH3+IXXMZfobJUE2A4exs4s5uqw8L8isAEC5WSgKkTuyKnd
	h8I1CVu9RaX1FA7FaL6Oi3ATAYAL4p1/PxWpa0GHxxb7LiS7MVf+Kx79bsVaLLBJ
	fDAPk7lyUZHbohH11ddPSasajaIhz+G9HuJ5KsBKEt2le1OlHfgEsBLIrxYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1704791177; x=1704877577; bh=oCTtnOtrl0OtG4czG0X3shoz53TC
	150412PTq+VJGcE=; b=A34xMMKtwrbRTFjcw6fh3+Hgoh9z7ueUsCxOZve3LJWP
	KBpKSgAbhwVLNID9CZFalvnXGOwItxl/+yFbn5RITXxKrPebfU+t8d511EkjdzNc
	e+5yOccirOJJlxGINbYWYbC+hINQgjhMmyBflUugUDtV7iQQq0cLSUNYbG1GwSz1
	zs9B2i0m7zgg5/63pWYqT+jl16T25i8E1421dPKa8UbZQax6lG8xQZAOkM9+fbC5
	+JmLod2KYIRcehva4IQWk4K41GIdEUh93g/hTx7aVSBcyEx+ZpW/cSPf3mK3dI5I
	fxQKQ8LlEQPn07Zy4pCEGRDya1lWaUhQmRXakl51vQ==
X-ME-Sender: <xms:iAydZaNNUdYr8K1HM6tJEnk2v31Tz1i2T2Q4vSoIYFTbbqZ39PWtxA>
    <xme:iAydZY-cmIA8F7R3iX9uYKAZTLtQ5-52X8Md82lhUZprw-hBUZRfB9ZGCfIKSDc4M
    eJ9xZEXSs6OKfAI3Q8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdehkedguddvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
    feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:iAydZRR71yovau_JE3oHM8eBlBkXA1dMrEdgSeqFvGkVWx10oam0gA>
    <xmx:iAydZavLpulUAZg1isGxeH2awjh62k-sUm5ssEzPkuZ-7moviVRhDA>
    <xmx:iAydZSce6J5UBp-9ZXaWWJnoL2SdjuUuEPbizcs0VG1p6g6RJqbO5g>
    <xmx:iQydZTopFPjhro7bxk_HF8e3HzMTX9-2AfFO3vbnm67petIZh6l8uw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4F740B6008D; Tue,  9 Jan 2024 04:06:16 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1364-ga51d5fd3b7-fm-20231219.001-ga51d5fd3
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <c6cd1b86-d468-4123-beaa-575206dc3555@app.fastmail.com>
In-Reply-To: <20240109083739.GE7948@google.com>
References: <0f6f432b-c650-4bb8-a1b5-fe3372804d52@gmail.com>
 <20240109083739.GE7948@google.com>
Date: Tue, 09 Jan 2024 10:04:35 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lee Jones" <lee@kernel.org>, "Heiner Kallweit" <hkallweit1@gmail.com>
Cc: "Pavel Machek" <pavel@ucw.cz>, "Andrew Lunn" <andrew@lunn.ch>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH] leds: Change devm_led_classdev_register_ext stub logic to use
 IS_REACHABLE
Content-Type: text/plain

On Tue, Jan 9, 2024, at 09:37, Lee Jones wrote:
> On Thu, 28 Dec 2023, Heiner Kallweit wrote:
>
>> If CONFIG_LEDS_CLASS = m and the caller of devm_led_classdev_register
>> is built-in, we get a compile/link error.
>> To avoid this we could add conditional compiling to the caller, but
>> exactly this overhead we wanted to avoid with adding the stubs.
>> Easiest solution is to use the existing stub also in case IS_ENABLED
>> is true, but IS_REACHABLE is false.
>> 
>> Fixes: 18764b883e15 ("r8169: add support for LED's on RTL8168/RTL8101")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202312281159.9TPeXbNd-lkp@intel.com/
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  include/linux/leds.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Arnd pretty much NACKed this, right?
>
> https://lore.kernel.org/r/b310230b-f20b-489a-97ed-908df193a942@app.fastmail.com

Yes, I actually wrote a replacement that does the opposite,
I just need to send that out.

    Arnd

