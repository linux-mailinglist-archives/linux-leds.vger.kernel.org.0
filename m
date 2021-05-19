Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C75D73888D2
	for <lists+linux-leds@lfdr.de>; Wed, 19 May 2021 09:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243639AbhESH6h (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 May 2021 03:58:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:45318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243741AbhESH6h (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 19 May 2021 03:58:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A454261244;
        Wed, 19 May 2021 07:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621411037;
        bh=jji5SktW4Dj3smenU3dBcINqgvxGXy84zv55D9Zdk/U=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=oBMbeDNNNXuw/Clxt16taxT41fy7Tzk0T5EDVnLfHUZ6TCQs3AOg7q3AgU8gLIkzj
         FuWrLtnsvNtSxo6Dx9AqdcEGhu9qLHEgbeQzhH1H8LOxRX9Kn6xX7XR+rI5OaZYCOn
         cDD/bv0xfDqj4KB36bbtrUiuIWqQdVnJYTIsIDp+sW6kk6BOEfRmJ/8/a145nGHVTu
         MBPmbmnCqandIZGh8+l63RbpabtuPGENNhLFzcXVauuVY+BvPFODTkqTcFsBI0hRfA
         TYroZp9Avyuu/J9hJeq5R4QR6Lye6v+kXZSC4RE07gEEH+XQ7hB7EuzKtIK0F0chHN
         vIkh1AuGe2HjQ==
Date:   Wed, 19 May 2021 09:57:13 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Pavel Machek <pavel@ucw.cz>, gregkh@linuxfoundation.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 06/17] leds: leds-nuc: allow changing the LED colors
Message-ID: <20210519095713.07be987d@thinkpad>
In-Reply-To: <f1fb0d3b7404bab46ba22a670ab58eb0e8b2389e.1621349814.git.mchehab+huawei@kernel.org>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
        <f1fb0d3b7404bab46ba22a670ab58eb0e8b2389e.1621349814.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

We have multicolor LED framerwork in Linux. This should be implemented
via that framework. Please do not implement your own way for RGB leds.

Marek
