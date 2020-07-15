Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 554C62213D9
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2020 19:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgGOR70 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Jul 2020 13:59:26 -0400
Received: from mail.nic.cz ([217.31.204.67]:34598 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725861AbgGOR70 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 15 Jul 2020 13:59:26 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTPSA id 8C7E1140968;
        Wed, 15 Jul 2020 19:59:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1594835964; bh=wSLE4bSdSmJMP5hpsSynAR0AfQ54sMsJNDTZBVOCjJM=;
        h=Date:From:To;
        b=vMqdUxGqpidHhI5kmr7U2ZRdspcEuLP3HEpRhraxy0n0BofPlhhoT7svUH3od1LT1
         G9XSUlJ+5Y698s7LPk9uWmOopQbOw5P3lPkvqmOUHmF1HdRuKC+1eyISpZ8eIK4xWq
         X//kaVHaAQelmwVe6xPDfp9yIeZOaWOXxiMjCwq8=
Date:   Wed, 15 Jul 2020 19:59:24 +0200
From:   Marek =?ISO-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>, jacek.anaszewski@gmail.com,
        robh@kernel.org, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v30 04/16] leds: Add multicolor ID to the color ID list
Message-ID: <20200715195924.51ab4dbe@dellmb.labs.office.nic.cz>
In-Reply-To: <20200715173610.GA31327@amd>
References: <20200713154544.1683-1-dmurphy@ti.com>
        <20200713154544.1683-5-dmurphy@ti.com>
        <20200715152056.3505e181@dellmb.labs.office.nic.cz>
        <20200715173610.GA31327@amd>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WHITELIST shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 15 Jul 2020 19:36:10 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> Thanks for patches, thanks for reviews, 1-4 applied.
> 									Pavel

The most important one is 5th, though :D
