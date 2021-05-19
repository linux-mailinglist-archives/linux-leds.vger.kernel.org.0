Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFA6388B58
	for <lists+linux-leds@lfdr.de>; Wed, 19 May 2021 12:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343764AbhESKKk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 May 2021 06:10:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:60460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233957AbhESKKj (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 19 May 2021 06:10:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FF2B611BF;
        Wed, 19 May 2021 10:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621418960;
        bh=e6BRmeAsjtFww4bCNqobqvDUOpLuhGjFBrJVeMjxl8w=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=RFDLeWLcMyK27LytjU33rUo2KoMxjRqnqVgofcd5u1gW2LF97mfGOp81KvgVZrb9Y
         TZzubrOZ+cWk0r/d39xhTqh2rCrsBY90g3a0/yDckEUMD87MKdxfTnrPO86golwL9z
         JXrXFKE9R7p0Py5WrJDteBVSF5aKak9GA6vb1Nwb4QQHWr3DSt2AfC313RuzbYcBq9
         ufxcvgfmn80eFq37VSdErk//ufn0TcfXHTJDIresqCjsAZiXxSLKKpxTNjBY2v7JzR
         lImtsCwf1XvjP/p7hesgg1jo2rShUF0bGZFzwgSF8lkDhxY+/c9+8XpYxFvM10VAJ6
         6T9hrjIm9GLHA==
Date:   Wed, 19 May 2021 12:09:15 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Pavel Machek <pavel@ucw.cz>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 10/17] leds: leds-nuc: Add support to blink behavior
 for NUC8/10
Message-ID: <20210519120915.40b4da10@coco.lan>
In-Reply-To: <20210519095843.2fa66bf8@thinkpad>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
        <f300479684e61d3aaa3790753851217f13a4821a.1621349814.git.mchehab+huawei@kernel.org>
        <20210519095843.2fa66bf8@thinkpad>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Em Wed, 19 May 2021 09:58:50 +0200
Marek Behun <marek.behun@nic.cz> escreveu:

> This should be implemented via the blink trigger or hw_pattern, I think.
> Have you looked at these?

The blink trigger and hw_pattern are software implementations for blink.

This is not the case on NUC leds, as:

1. It is the hardware/firmware that triggers the blink, not Linux;
2. It blinks even when Linux in suspend/hibernate mode.

In a matter of fact, the default usage of blink is to indicate that the
machine is suspended.

Thanks,
Mauro
