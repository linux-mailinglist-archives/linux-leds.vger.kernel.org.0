Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23D9916AF8
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2019 21:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbfEGTNz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 May 2019 15:13:55 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37187 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbfEGTNz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 May 2019 15:13:55 -0400
Received: by mail-lf1-f67.google.com with SMTP id h126so1517418lfh.4
        for <linux-leds@vger.kernel.org>; Tue, 07 May 2019 12:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/aL4Ynu4SHLRykFw8Ovhj2LHjZukpKowXwcKSCuAsJc=;
        b=oTtvrjGmVleYFIIPF9poRF34mHRVqCedGrFXCfuKjsFVO9Dfw6aorZI2dy9QMA6zZX
         ADG9GAtzumjtsZeIpZrmxnYxQ5jTTcLqIha1KXFMAIkuwYdRn3FiPEVSWJPqCBIwIb28
         ZebJT4oY2QqVZcjrjjz9yRWGP9RhvHr0CMZUCeam0Yy9gAibx57aQ0Der0apymUzEnxJ
         49N9YbKNFvV9J2DBe1w35ccsRAv8efxKvOz/9rImTpwcwKaLZfB/OK9WJY6VENV9PBxV
         VNCSCNNUxgCxQCDKnBNHvzjuP34ncho/rOruJVFoIYDhFgKnlbwh6GvnCeDcz3B8IK+f
         BPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/aL4Ynu4SHLRykFw8Ovhj2LHjZukpKowXwcKSCuAsJc=;
        b=P6ITmzIvSZXZDjoA88rtpg8PE9/1y7qDfirgQRKGMXFVELiDZxus5liTG6f2h70az3
         uAoNqbaD190rJyl2M8e0x1vpmpgcyNgrHQyUWjCTv+7Ed7tLHQitHpV4YbHz1WbP99YI
         aAL6WXHKA64M882iJV5FJYSZrvSxeTZMuNjVhAe+q3AqdRu4blP/3RiUA/TgihWqiPFQ
         xIi6B1pdcAklszDCcQIxXsYZQ2LYfuoYtP4lbG5V+RGUWF9KmCCr6mBKTFZZVE+8sehC
         ++m56893tiLE9LlWdh7AOXkfER7jZnhTrr/8pEE86gLqGweDm+QYdvrS6H7KAtW0DzhH
         G9tw==
X-Gm-Message-State: APjAAAUgiY4jNrcIzNlw+7aINRPtyWLeIWyVrldmhX0BVzh+rNUR48J5
        PZSpQdClUYLZLnjn4yUp8VxZDnhsSA0=
X-Google-Smtp-Source: APXvYqxTCNTc9sn71ZqMezMgdIHx8LNNuH81VsjI+qd4UKSeMwf+MiBiA2s5FdxBl6I7/G1peC7JMw==
X-Received: by 2002:a19:c394:: with SMTP id t142mr2716182lff.102.1557256432887;
        Tue, 07 May 2019 12:13:52 -0700 (PDT)
Received: from [192.168.1.19] (bgw158.neoplus.adsl.tpnet.pl. [83.28.86.158])
        by smtp.gmail.com with ESMTPSA id l15sm3007267lji.5.2019.05.07.12.13.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 12:13:51 -0700 (PDT)
Subject: Re: [PATCH v3 0/7] LMU Common code intro
To:     Dan Murphy <dmurphy@ti.com>, Lee Jones <lee.jones@linaro.org>
Cc:     pavel@ucw.cz, linux-leds@vger.kernel.org
References: <20190430191730.19450-1-dmurphy@ti.com>
 <34088323-9b40-7dea-5449-6a01bb721c00@gmail.com>
 <8166c0c1-facf-14da-7c71-5bc5a3cc23f7@gmail.com>
 <bc5756ac-b383-dac3-4a45-c0ace03ce9ec@gmail.com>
 <bf6768b6-2795-5904-15e1-75109a694fcd@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <2f786e83-0776-9bcb-a485-6e03c8db87ce@gmail.com>
Date:   Tue, 7 May 2019 21:13:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <bf6768b6-2795-5904-15e1-75109a694fcd@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 5/7/19 9:06 PM, Dan Murphy wrote:
> I have posted v4 with requested corrections plus I have an additional patchset that is based off of this patch set
> for the LM36274.

Yes, I've seen it but it was quite late. Let it receive
fair testing.

> I can post that as well and we can present everything for 5.3
> 
> Maybe even the base MC FW ;)

Is it somehow related?

-- 
Best regards,
Jacek Anaszewski
