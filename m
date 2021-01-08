Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ABF92EF515
	for <lists+linux-leds@lfdr.de>; Fri,  8 Jan 2021 16:46:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727375AbhAHPpt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Fri, 8 Jan 2021 10:45:49 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:39228 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbhAHPpt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 8 Jan 2021 10:45:49 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 152511C0B81; Fri,  8 Jan 2021 16:45:07 +0100 (CET)
Date:   Fri, 8 Jan 2021 16:45:06 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Zheng Yongjun <zhengyongjun3@huawei.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 -next] leds: convert comma to semicolon
Message-ID: <20210108154506.GA7047@localhost>
References: <20210108092446.19547-1-zhengyongjun3@huawei.com>
 <fde7dc3b-9ca6-6009-eb16-b325641e3f4a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <fde7dc3b-9ca6-6009-eb16-b325641e3f4a@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri 2021-01-08 07:14:08, Dan Murphy wrote:
> Hello
> 
> On 1/8/21 3:24 AM, Zheng Yongjun wrote:
> > Replace a comma between expression statements by a semicolon.
> 
> Can you add a "Fixes" tag here?

Don't. Its just cleanup, we don't want it in stable. Patch is fine as is.

-- 
