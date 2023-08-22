Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFF32784EA2
	for <lists+linux-leds@lfdr.de>; Wed, 23 Aug 2023 04:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232209AbjHWCTp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Aug 2023 22:19:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbjHWCTp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Aug 2023 22:19:45 -0400
X-Greylist: delayed 903 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 19:19:42 PDT
Received: from symantec4.comsats.net.pk (symantec4.comsats.net.pk [203.124.41.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE0CB185
        for <linux-leds@vger.kernel.org>; Tue, 22 Aug 2023 19:19:42 -0700 (PDT)
X-AuditID: cb7c291e-055ff70000002aeb-e4-64e5544fa61e
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id C6.E2.10987.F4455E46; Wed, 23 Aug 2023 05:35:27 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=HtFyutjs3in0QBqzVM6E7XSjnSH/DX/zi/7qmVX+TG6gE6WQXVgNVSK943R+eEDNv
          fFZkafcoaM3t0rAz2uKWxYadavOOv9BT6Hw8SRtrpDatFSGlz8V1yr9tjswCtgkr6
          /vH8m2uKwY+k2XVHTKVxC0B3uUbvdbqiysQPg1oPM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=EBOQxbqqH9G1F5F/LIX84dJOWd9rY2xRiSOaEr7XZamj3AzDn+KiK5yz7Xkem9EWV
          kQg3ZGinF4wqoidpYYZMKBvkbXzD45pkWup4AYgvwdVRCVLsWxh36FCpufPeUrJj1
          sujCIMIvSBxE0k8SIAlB4fjgzh+QgZld4eiGb8KBY=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Wed, 23 Aug 2023 04:31:02 +0500
Message-ID: <C6.E2.10987.F4455E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To:     linux-leds@vger.kernel.org
From:   "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date:   Tue, 22 Aug 2023 16:31:17 -0700
Reply-To: chnyne@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDLMWRmVeSWpSXmKPExsVyyUKGW9c/5GmKwbmZShZb36xjdGD0+LxJ
        LoAxissmJTUnsyy1SN8ugStjyboLLAW7mSva+hexNDA+Zupi5OSQEDCR2H/nM3sXIxeHkMAe
        Jol3J3cwgjgsAquZJdY+aWOFcB4ySyz8vpgRoqyZUeJeYx8zSD+vgLXE+f2vWEFsZgE9iRtT
        p7BBxAUlTs58wgIR15ZYtvA1UD0HkK0m8bWrBCQsLCAm8WnaMnaQsIiAnMTOM5UgYTYBfYkV
        X5sZQWwWAVWJg5veg00XEpCS2HhlPdsERv5ZSJbNQrJsFpJlsxCWLWBkWcUoUVyZmwgMtWQT
        veT83OLEkmK9vNQSvYLsTYzAMDxdoym3g3HppcRDjAIcjEo8vD/XPUkRYk0sA+o6xCjBwawk
        wiv9/WGKEG9KYmVValF+fFFpTmrxIUZpDhYlcV5boWfJQgLpiSWp2ampBalFMFkmDk6pBka1
        1OxYz6dMazm2L3odsCbynlyK3KtrbxaHGhXxHKtfffRMxLrQuaX3d250KYnZdJr/fv2HuNub
        f3X8bovo7K26b7r44pr5QUzHqy+t395jV99xMGxGZ6f65gOPVrR2aF83itR9bS4bX2Bh1zTX
        5Yl45/7+EN51FTEO9Sn+d5KziljUfX+u2abEUpyRaKjFXFScCACblFpDPwIAAA==
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_LOW,RCVD_IN_SBL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: iesco.com.pk]
        *  0.1 RCVD_IN_SBL RBL: Received via a relay in Spamhaus SBL
        *      [94.156.6.90 listed in zen.spamhaus.org]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
        *       low trust
        *      [203.124.41.30 listed in list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China

