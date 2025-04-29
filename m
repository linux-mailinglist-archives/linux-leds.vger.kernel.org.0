Return-Path: <linux-leds+bounces-4558-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3F7AA1AED
	for <lists+linux-leds@lfdr.de>; Tue, 29 Apr 2025 20:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D65661BC05A2
	for <lists+linux-leds@lfdr.de>; Tue, 29 Apr 2025 18:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CFDE245006;
	Tue, 29 Apr 2025 18:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oFaUaECC"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69D1367;
	Tue, 29 Apr 2025 18:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745952609; cv=none; b=RLABrxyYPp4tMTvs5nvu7AvVBsFyfJdRNcttVCI/sMHxpRtreswjl2+cU6lKRaMQvoeVJ0G77gR6QAP29NSOf5BYZUX61LQ6wzXygI11f39NMS/x9jmmIP26bUfKdrY6jo2xBmRApHf/QJjV0olpd1u1pYQd2Cgc0tBPcTGvUwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745952609; c=relaxed/simple;
	bh=gUTlekWoOXWSqClwmax5ebx7LlIR/bJhdqMP6ILtIgE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bYov/KEqwL9liTQax/rGVZF34YytbDY6vuMqjZPQWvaYZLQWkFeq9HLVWlvyi78r9Z8jo8hU2snFZM/o26AfgkaCnQv8FetL+atOGZUpNOTy/0+0b7siVZTO1jElJWMViOcp8a2/rQDEMTt+PrGLD5l5npSYHM6JUjxj0/T+hzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oFaUaECC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80442C4CEE3;
	Tue, 29 Apr 2025 18:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745952608;
	bh=gUTlekWoOXWSqClwmax5ebx7LlIR/bJhdqMP6ILtIgE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oFaUaECCbl+tVPZx685vvTxIODoSj/3bqA4MtbU6jhJW88pULu4yP2BREteSHfHny
	 BPZRX4rNAnuJWF2RUTINKH0M9tx2E8oL6aWkwubaMOW8QhZJWzWbkGAxN4y5jfKKHW
	 /Cg5cjvXyJc0t6qNGMxKdsts/coZz97zxExv8eQx76Ns6o70rxgXrKLkQn+VCPHc5r
	 hAs0WUiod1gK/BSbZ9IwYogtqFdb/E8+fBFWBvTH3gqDsIO+BSaV6tLXhDUu1lC5W/
	 yTu0qKqV4od8R6weL3kJm2F8XEIScuvTMRmrBlLdHJexI+0Z3rSPIr9SD5VI/nsukW
	 ExX76Iv5Bfy6A==
Date: Tue, 29 Apr 2025 11:50:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Tobias Junghans <tobias.junghans@inhub.de>
Cc: Lee Jones <lee@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 linux-leds@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3] leds: trigger: netdev: refactor dev matching in
 netdev_trig_notify()
Message-ID: <20250429115007.12f8af38@kernel.org>
In-Reply-To: <20250425132059.393144-1-tobias.junghans@inhub.de>
References: <20250425132059.393144-1-tobias.junghans@inhub.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 25 Apr 2025 15:20:45 +0200 Tobias Junghans wrote:
> If there are network devices with the same name in different
> namespaces, ledtrig-netdev gets confused easily and switches between
> these devices whenever there are NETDEV_CHANGENAME/NETDEV_REGISTER
> notifications.  This happens since ledtrig-netdev only checks for
> device name equality regardless of previous associations with another
> network device with the same name.
> 
> Real world example: eth0 is the primary physical network interface and
> ledltrig-netdev is associated with that interface. If now Docker creates
> a virtual Ethernet interface (vethXXXX), moves it to the
> container's net namespace and renames it to eth0, ledtrig-netdev
> switches to this device and the LED no longer blinks for the original
> (physical) network device.
> 
> Fix this by refactoring the conditions under which to return early with
> NOTIFY_DONE inside netdev_trig_notify():
> 
> - For processing NETDEV_REGISTER events, the device name has to match
>   and no association with a net_dev must exist.
> 
> - For processing NETDEV_CHANGENAME events, the associated and notified
>   network device have to match. Alternatively the device name has to
>   match and no association with a net_dev must exist.
> 
> - For all other events, the associated and notified network device have
>   to match.

Could you split this into two patches for ease of review?
First which factors out all the logic related to deciding if the event
needs to be handled, move it to a new helper which takes the relevant
args are turns bool of whether we should return NOTIFY_DONE immediately
or not. And then a second patch which modifies this logic.
Having the refactor squashed with the change makes it harder to review.

