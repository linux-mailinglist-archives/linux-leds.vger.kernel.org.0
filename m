Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1079851AD1D
	for <lists+linux-leds@lfdr.de>; Wed,  4 May 2022 20:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377079AbiEDSo7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 4 May 2022 14:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237001AbiEDSo6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 May 2022 14:44:58 -0400
Received: from mail.schwermer.no (mail.schwermer.no [49.12.228.226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F6FB645E
        for <linux-leds@vger.kernel.org>; Wed,  4 May 2022 11:41:20 -0700 (PDT)
X-Virus-Scanned: Yes
Message-ID: <8917a521-6d40-7b84-ac1e-fdbeed60eb58@svenschwermer.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=svenschwermer.de;
        s=mail; t=1651689678;
        bh=TVBdDSFVESVgYQyHYHy0k+sZREBZ8FExL2Swdn9iIzE=;
        h=Subject:To:Cc:References:From:In-Reply-To;
        b=TGBVCVP8MHUpfVv1BAxLlJ0GbLnRAdT0xqJhr2UncO5sak2Ajgr4Y4Lc4pUfTtP7w
         WUDTwT8pfCe+4Ks3C0FrkOS9QnllhGGYDNjFoMUMbn7OEMuCmQ9VuP5S3ikqSIM155
         mC3Wk1tVWopJJ7mhiGmLyXMYAisYhB69EECzJcnqZJV7ALs6NcmXwP48R0r1wBau6i
         Zd4rZ+dyah0knJfHr4zBteJgjyc9RMw+jSAXtUiJXW8rBbrAY8koLGeX3HzvgMWFDS
         HNqS9bMDlkDqVX4rPKjKIl5EJgXs9eRXllvK/dhrU53/xHjwNzF6WZ1yTzU/L9GkXB
         EtulKkHcjMRUw==
Date:   Wed, 4 May 2022 20:41:16 +0200
Mime-Version: 1.0
Subject: Re: [PATCH v8 0/3 RESEND] Multicolor PWM LED support
Content-Language: en-US
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org
References: <20220407073225.71605-1-sven@svenschwermer.de>
 <20220504174744.GD8725@duo.ucw.cz>
From:   Sven Schwermer <sven@svenschwermer.de>
In-Reply-To: <20220504174744.GD8725@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 5/4/22 19:47, Pavel Machek wrote:
> Hi!
> 
>> I believe this patch series is ready for merging.
>>
>> Pavel, please let me know if you need more to get this merged.
> 
> Thank you, applied.

Thank you!

> Could I get you to submit patch to move this driver into
> drivers/leds/rgb/ ?

Coming up... :)

Best regards,
Sven
