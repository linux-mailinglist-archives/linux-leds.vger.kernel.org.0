Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BFC1621664
	for <lists+linux-leds@lfdr.de>; Tue,  8 Nov 2022 15:27:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233809AbiKHO1M (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 8 Nov 2022 09:27:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234114AbiKHO0p (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 8 Nov 2022 09:26:45 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCA991182E
        for <linux-leds@vger.kernel.org>; Tue,  8 Nov 2022 06:25:31 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id v3so13533818pgh.4
        for <linux-leds@vger.kernel.org>; Tue, 08 Nov 2022 06:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=dj7L8L4Tt3T52fNCiLgU1wmk4q3GKw+FgtxNNdpNZejQJQ1k3Xi+uLyqI46mZtlAe9
         HLOA9P1jXmiTZuSDq5pdxRxdF0a/HoEZnGcKQ3YQ37POKm1J5RjeTmEaXOGvNGsQ/aCd
         x8X3wRq447BygztmxjMMFJOJydFOJUOGXobl/qzDVFAJS2xNGHdVGGQVxwZyaR/NBt0/
         bE+cdHmQ/pyeyXGzJcY+3ABqxwuM8e+fvQz2jyAv1cJHWTFyjffI5j3/3Sk+yOdlf96H
         6ymXuWHpJpL3yt30UdlgfE5yAEKuZaLtj9+SPJvm7HvWfCahTeKPqye7UyLe1WT7erj+
         Thwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=UHBsFobreVSc1hPoFlCUAvBTtn5T7clso069MCloWpWZB5GLRmfG0HAupGYAqFguMd
         p2cwCKjcXGZCQqeLZTVc6jy6F9XhqfM2jJPhHXjBtGLfeJEWHv8C3yUkLmH18iDvVQo4
         P6K1PRAFz9QXDwIQtX/2X7onxnlBH02T0GXT726YITra87xKpFG98vne2uKv9PLZX/L7
         yad9ZWZLdMaOtUihM802sG3DLx2UjN1Y2CSC9sBUP+x9DCTHfO73orBaRx/FFpOgOlf8
         PvUP9c7Puzuv6K/bdtB4VUDssZpZ4zn624ImSfOJE5C+Hvtbq68p7aVN3aDll5YYtBfl
         LPvg==
X-Gm-Message-State: ACrzQf2Go6+fa0c0YfI+6vcEZH6Z/tc9/90qvEvkiuY00AXeVHFgA39S
        t3faVpDf9Qk74sl+pOWIub+1paR8O+PLs3Q5EDQ=
X-Google-Smtp-Source: AMsMyM5/o8Tv1jtvv5i5ish68BM3WfS9X9eqWOTVG2elMlgZjohDVk/23K/5zEIB58o7eHSGPzDyTC5sLFDQxOS4ibc=
X-Received: by 2002:a63:2c8b:0:b0:41c:5f9e:a1d6 with SMTP id
 s133-20020a632c8b000000b0041c5f9ea1d6mr47624667pgs.601.1667917531062; Tue, 08
 Nov 2022 06:25:31 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7300:5388:b0:85:81c6:896c with HTTP; Tue, 8 Nov 2022
 06:25:29 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <davidkekeli11@gmail.com>
Date:   Tue, 8 Nov 2022 14:25:29 +0000
Message-ID: <CAPBO+FLUDBD86dHQM6-TOwtKbf996Qz13VQWrvY27T9ETbCTEA@mail.gmail.com>
Subject: Greeting
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:534 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4915]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mr.abraham022[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [davidkekeli11[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [davidkekeli11[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham
