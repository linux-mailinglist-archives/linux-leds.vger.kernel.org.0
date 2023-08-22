Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D92CD784867
	for <lists+linux-leds@lfdr.de>; Tue, 22 Aug 2023 19:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbjHVR2e (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Aug 2023 13:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbjHVR2d (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Aug 2023 13:28:33 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB3C7615B5
        for <linux-leds@vger.kernel.org>; Tue, 22 Aug 2023 10:28:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QlsF9zMutj1ch5wSQsbYcPYrkaY+K2v28IWsY/5a09R6LarYLiPAIvQUv2RAf70UwvKnEAv9xlm/GOD38w4jbhhtfSvZQwN6HRWkablQO83dDJzqeeOGFSjTIjD5cv3qx9W48mCb+oldo5FBZIB9l8QhpEnBIih9ihEDo/w4m2yPXY4QhaPnuU6T0vJBnWK4kzhj/1Hg0vTDdroO40gtG7kjY4RByFew02YYfNjlB3lgN59240yrZ5S/o6/3hI9z3krjL72ZrlW/CE3uxLzMFrBnL7Cga+ho6QQUZ10wlBaTlK/LyS6CsGrXwzAiaq793YuT5aF2apbecdfxQirsOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Y7Dzm7B4kFw1PbfwoTr9ZJZ28H20ahCegTklnh9ZCs=;
 b=nBpNzE71ijvsrTNVvYPzpXVyZNZUkeEQYLO2gei02aQJlP/f/W7K2IXHW7rDgJkWQN1g0zFNNzdf8hEKK7EzQD6SZbylbCRBQ/dJ2DHwnY54YQ84mcFvD6Gei9tMRjTURKIjPS6rPfXkJ9wahVFl5e+h4jphWCnhpAKOZ9lOLmuouUI7YjTq2i4yglgEA+FynUtfYTyPwpsG3+QBrkgTU8Q9FEDkdI9Nj6zm2Je4B6HTP/SHaL6bkkN2A5a0qNJ1A75VBW7cu5kYUAc6tHUoLgF69W0WQFs31B2HadDvIT4+gAS0QZzTMiX/HiX6Z9RDUl1bRi0XvHr5e8z0kCgH8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=ucw.cz smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Y7Dzm7B4kFw1PbfwoTr9ZJZ28H20ahCegTklnh9ZCs=;
 b=C48Y62RxIjyq272VAvW0e2Sbbo4IG47fhktrfFURNpPQa6M+QdS1jSI6bqnPTCpZMPql6MldkNySnYj7j8NytTUCdOU/xG+j6BgfuRPmXGYSDVioJyrWJjo8kW6YV7tz49huu23mcRJEShunhw55KAqS1JtG1ji+JasLa0KVDgVkf0/iDMvWCRaDhEAcoONloAGd+xXq4ypjpkhxbGQb1jJ7z1mb2i3EFv0ByFJ/sKaRxXZ+cjRVIcpHdz3RUj8TtQdoct9/qFp55SSrxyiLu2jlktU+XU6xKQl9O+hi6QcVeivwX5g9Ym12CCvu3CsYLuNJ/azbGIxt9zO91rLJ/w==
Received: from SN7P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::34)
 by SJ0PR12MB6781.namprd12.prod.outlook.com (2603:10b6:a03:44b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 17:28:28 +0000
Received: from SN1PEPF00026368.namprd02.prod.outlook.com
 (2603:10b6:806:124:cafe::43) by SN7P222CA0009.outlook.office365.com
 (2603:10b6:806:124::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 17:28:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF00026368.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.14 via Frontend Transport; Tue, 22 Aug 2023 17:28:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 10:28:15 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 10:28:13 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 0/2] leds: mlxreg: Change behavior during init and remove unused definition
Date:   Tue, 22 Aug 2023 17:27:55 +0000
Message-ID: <20230822172757.60851-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026368:EE_|SJ0PR12MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: 1685cfe1-cc33-4202-87d6-08dba3353224
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U5kZewLPx6k8oqaW64Ui0oTxfBLl48BmDvxmsaqhqVYwjWmU6/JW+jbYJ60klGiA/8pZTgibdzDQqJzeb/bSO4R7MiMAlcwRCkVT2hABbrocctr05umQaBMAjH39V0eKFDlOa1SSlsEgTVnclAlhpUEs2ErWTtFcM1WEFGqtwzhWQhIKLlT6VjlKt7Y1S3DnoFjYQ2Dy4qNu/Sepj78TxpRsWqG0+v6H1ad+k0YSwoYhRwfP+unt1T0BNEWtSOtM7a2bdi42JyuMHGTf6Ni9+16q9goxW01qsgom8RwYM0hFqPWg7F/arvmjs5hz3AO9bmwJxSD5kBGl5b+Rt/uFRi6RJ4t0NUpSiWYxtOZZKr7P/KA/E8MUtV17Y2Fo6usIA+VSeSAZ7QRi3ciVesZKoVNkjc1Gs3omOciXZDdBTzyLzFH+HiqLGZ+AyxQ5m02L59MYGZSzru6SBnh+GOo0mLBx87LBD1KD2Vt1LAsrDQAfKRpY+9VJl2sh9cTMdctjH1SbUwlUhTLeFS52BbgilvBj7YHiJLJ6QUI7ZvpCe4VQxGSrgc5N3lomV3J9Gmp5+x5IVbFFuAqRz+HOumSpkUcg0WDrra3WZgHBn6wj9XDCVRLq0setl1rgy+9BYMKtPpLjc0DvYc6jEPd3wJXlLOskz3aOO2+u/atx2XdzpZhPA1XPe7K0DfrhsYkGIT71TAbHxwK/SZBNKxkqQ6v8a7PnML4o/B8/pjbWx5H43RnMAEL1vnk/uxiMZJUkAErw
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(376002)(346002)(186009)(1800799009)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(70586007)(316002)(6916009)(54906003)(8676002)(2616005)(4326008)(107886003)(8936002)(70206006)(1076003)(36756003)(40460700003)(41300700001)(82740400003)(356005)(478600001)(6666004)(40480700001)(4744005)(2906002)(7636003)(47076005)(83380400001)(86362001)(36860700001)(426003)(5660300002)(336012)(16526019)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 17:28:27.1343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1685cfe1-cc33-4202-87d6-08dba3353224
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026368.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6781
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The patch set contains:
Patch #1 - remove unused color definition.
Patch #2 - remove LED color setting during initialization, leaving this
	   decision to application level.

Vadim Pasternak (2):
  leds: mlxreg: Remove code for amber LED colour
  leds: mlxreg: Skip setting LED color during initialization

 drivers/leds/leds-mlxreg.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

-- 
2.20.1

