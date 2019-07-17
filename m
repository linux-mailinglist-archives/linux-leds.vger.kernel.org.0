Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A84FD6BE3C
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jul 2019 16:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbfGQO2g (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Jul 2019 10:28:36 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:53713 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbfGQO2f (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 Jul 2019 10:28:35 -0400
Received: from [192.168.1.110] ([77.7.13.186]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mft3h-1iP0Y13Lp3-00gJ2U; Wed, 17 Jul 2019 16:28:28 +0200
Subject: Re: [PATCH 1/6] leds: apu: drop superseeded apu2/3 led support
To:     Pavel Machek <pavel@ucw.cz>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, jacek.anaszewski@gmail.com,
        dmurphy@ti.com, linux-leds@vger.kernel.org
References: <1563202653-20994-1-git-send-email-info@metux.net>
 <1563202653-20994-2-git-send-email-info@metux.net>
 <20190716193001.GG10400@amd>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <da2dccb7-f2f5-42b5-2549-ba67ecd568cb@metux.net>
Date:   Wed, 17 Jul 2019 16:28:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190716193001.GG10400@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:asNcSCjsSQlPQRlhr2kK3hVhHWkPu38vhyLc1asPVC9P6y0E/6d
 oqFgJ2u0kx+H/mBFhe8TqkvmA+8527ZZY25HBiSEnJNHXu9waBOO1f76A3ZEJ73ah3JKA5y
 uv5rCeYymDoigVAvf1AEiiNruycRrzP4bvRwnu0AVLyqGXS3RE5ZHB5Z1sba1CG3JFHK9gq
 eUf6pS5oWuY3SsOgupEgQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HLh0PyKECs0=:+0B0JXf2JTUwwIKrRE6J6c
 eiZ0oJTqlEZ1+EW6jLjMzVyjrvKa+5ekuw4fmloTeIjIJ1YgEe1LdpzI0pqotPKZsSj6CCTA1
 L6r+4dONEu+c6kpdKJE/UmaoUwRg7i7PqXQH5P2CGsqYfKhf/cIuMYmuYmooRNpN7zKfHYJn9
 KLg1Q0IlQesvDmMwwiloK+gjRAbuLrhx9WxpY2RTVv1H0SivRALXqAoFSjKUXGd+f/S3YPoxb
 mnafjgnpys/YU97AnCwlUsaVo+wryGbQUAd45/rPiIqUWJtoylbNtuJQ9ziJQlbVWZjg4j5k7
 AtLn8J2mbHe1mRS5zjYt3eKPyWMhzv4NOMkfH9/3DQft2jq2xF27j/iAZzbYacgipNKdNOvuJ
 OamdA4dterKHxBvAtYCsrUgHTvhXxHJH7Gib5/4Vb6PH8FD5RQbgZgNFTFEb3aiu0Jz15ysnC
 xJv8WIUU6yCzNWjNM+/UFs+2uusw18Nermy5kHI6/B5OsdV6ldJUZ6hYfmMysf95vjM/oLR/E
 0CCbh/hy6XSAgNT4dCnQiERptOGL3UhIUCXJ2Bd+R1f6rK66hGWickyQZ4QrWzWG5fqsykVq1
 cE8uLrfFgjhuzgDyk+u+TskIRhlmBZGPlqZl3PGWemwqdXkpr0nj5HwJS0neriuKhX7hruY8t
 R2lmQi8sfNUELMseXV+grzPNvmfuyk3MGvqWo2LjCZzSrd6EdsfELZ6CG9Yo2X2ZA9YdNb9ZM
 A4SFTUOgZYT/8uMC4bl+QE5epDFz2U7hkMbul72QYAv3QNkaVYRyZSW6leA=
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 16.07.19 21:30, Pavel Machek wrote:

Hi,

> Ok, so I understand the reasons, but people updating from old kernels
> (make oldconfig) will see nothing and their LEDs will stop working.
> 
> Can we do something to help them?

I could announce that in pcengines forum. There've been several
discussions on this matter, replying there should give the participants
an automatic mail.

So far, I haven't seen any distro that enabled the old driver, so I
guess the actual users all compiled the kernel on their own and should
notice the change early enough.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
